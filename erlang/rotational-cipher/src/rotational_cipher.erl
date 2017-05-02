-module(rotational_cipher).
-export([test_version/0, encrypt/2, decrypt/2]).

test_version() -> 1.

encrypt(Plaintext, Distance) -> [rot_letter(Letter, Distance) || Letter <- Plaintext].

decrypt(Ciphertext, Distance) -> [rot_letter(Letter, 26 - Distance) || Letter <- Ciphertext].

rot_letter(Letter, Distance) when Letter >= $a andalso Letter =< $z -> ((Letter - $a + Distance) rem 26) + $a;
rot_letter(Letter, Distance) when Letter >= $A andalso Letter =< $Z -> ((Letter - $A + Distance) rem 26) + $A;
rot_letter(Letter, _) -> Letter.
