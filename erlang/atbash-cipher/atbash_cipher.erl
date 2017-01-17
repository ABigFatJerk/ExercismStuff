-module(atbash_cipher).
-export([encode/1, decode/1]).

encode(String) -> Preprocessed = encode_preprocess(String),
                  Transformed = lists:map(fun transform_one_letter/1, Preprocessed),
                  encode_postprocess(Transformed).

decode(String) -> Preprocessed = decode_preprocess(String),
                  lists:map(fun transform_one_letter/1, Preprocessed).


encode_preprocess(String) -> Stripped = re:replace(String, "[\\s,\\.]", "", [global, {return, list}]), string:to_lower(Stripped).

decode_preprocess(String) -> re:replace(String, "[\\s]", "", [global, {return, list}]).

transform_one_letter(Letter) when Letter >= 97, Letter =< 122 -> 122-(Letter-97);
transform_one_letter(Letter) -> Letter.

encode_postprocess(String) -> string:strip(re:replace(String, "[a-z\\d]{5}", "& ", [global, {return, list}])).
