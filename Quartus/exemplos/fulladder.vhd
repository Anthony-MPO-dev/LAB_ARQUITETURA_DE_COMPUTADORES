library ieee;
use ieee.std_logic_1164.all;

entity fulladder is
   port(a, b, cin: in std_logic;
	     sum, cout: out std_logic);
end fulladder;

architecture synth of fulladder is
   signal p: std_logic;
begin
  p<= a xor b;
  sum <= p xor cin;
  cout <= (a and b) or (p and cin);
end synth;
