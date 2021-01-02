-module(complex_numbers).

-export([abs/1, add/2, conjugate/1, divide/2, equal/2, exp/1, imaginary/1, mul/2, new/2,
	 real/1, sub/2]).


abs(Complex) -> R = real(Complex), I = imaginary(Complex), math:sqrt(math:pow(R,2) + math:pow(I,2)).

unpack(Complex1, Complex2) -> {real(Complex1), real(Complex2), imaginary(Complex1), imaginary(Complex2)}.

add(Complex1, Complex2) -> {R1, R2, I1, I2} = unpack(Complex1, Complex2), 
                           R = R1 + R2, 
                           I = I1 + I2, 
                           new(R, I).

sub(Complex1, Complex2) -> {R1, R2, I1, I2} = unpack(Complex1, Complex2), 
                           R = R1 - R2, 
                           I = I1 - I2, 
                           new(R, I).

mul(Complex1, Complex2) -> {R1, R2, I1, I2} = unpack(Complex1, Complex2), 
                           R = R1 * R2 - I1 * I2, 
                           I = I1 * R2 + R1 * I2, 
                           new(R, I).

divide(Complex1, Complex2) -> {R1, R2, I1, I2} = unpack(Complex1, Complex2),
                              Denom = (math:pow(R2, 2) + math:pow(I2, 2)), 
                              R = (R1 * R2 + I1 * I2)/Denom, 
                              I = (I1 * R2 - R1 * I2)/Denom,
                              new(R, I).

equal(Complex1, Complex2) -> {R1, R2, I1, I2} = unpack(Complex1, Complex2),
                             equal_enough(R1, R2) and equal_enough(I1, I2).

equal_enough(Num1, Num2) -> erlang:abs(Num1 - Num2) < 0.005.

exp(Complex) -> R1 = real(Complex), I1 = imaginary(Complex),
                Scalar = math:exp(R1),
                R = math:cos(I1),
                I = math:sin(I1),
                new(Scalar*R, Scalar*I).

conjugate(Complex) -> R = real(Complex), I = -1 * imaginary(Complex), new(R, I).

new(R, I) -> {complex, R, I}.
imaginary({complex, _, I}) -> I.
real({complex, R, _I}) -> R.
