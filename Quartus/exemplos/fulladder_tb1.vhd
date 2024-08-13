library ieee;
use ieee.std_logic_1164.all;

entity fulladder_tb1 is
end fulladder_tb1;

architecture sim of fulladder_tb1 is
   -- declara o componente
	component fulladder is
     port(a, b, cin: in std_logic;
	       sum, cout: out std_logic);
   end component;
	
	signal a, b, cin: std_logic;
	signal sum, cout: std_logic;
	
begin 
  -- instancia o DUT
  DUT: fulladder port map(a => a, b =>b, cin =>cin, sum =>sum, cout =>cout);
  
  process
  begin
    --Entrada 000
	 a <= '0';
	 b <= '0';
	 cin <= '0';
	 wait for 20 ns;
	 assert ((sum = '0') and (cout = '0')) --saida esperada
	 report "Teste falhou para a entrada 000" severity error;
	 
	 --Entrada 001
	 a <= '0';
	 b <= '0';
	 cin <= '1';
	 wait for 20 ns;
	 assert ((sum = '1') and (cout = '0')) --saida esperada
	 report "Teste falhou para a entrada 001" severity error;
	 
	 --Entrada 010
	 a <= '0';
	 b <= '1';
	 cin <= '0';
	 wait for 20 ns;
	 assert ((sum = '1') and (cout = '0')) --saida esperada
	 report "Teste falhou para a entrada 010" severity error;
	 
	 --Entrada 011
	 a <= '0';
	 b <= '1';
	 cin <= '1';
	 wait for 20 ns;
	 assert ((sum = '0') and (cout = '1')) --saida esperada
	 report "Teste falhou para a entrada 011" severity error;
	 
	 --Entrada 100
	 a <= '1';
	 b <= '0';
	 cin <= '0';
	 wait for 20 ns;
	 assert ((sum = '1') and (cout = '0')) --saida esperada
	 report "Teste falhou para a entrada 100" severity error;
	 
	 --Entrada 101
	 a <= '1';
	 b <= '0';
	 cin <= '1';
	 wait for 20 ns;
	 assert ((sum = '0') and (cout = '1')) --saida esperada
	 report "Teste falhou para a entrada 101" severity error;
	 
	 --Entrada 110
	 a <= '1';
	 b <= '1';
	 cin <= '0';
	 wait for 20 ns;
	 assert ((sum = '0') and (cout = '1')) --saida esperada
	 report "Teste falhou para a entrada 110" severity error;
	 
	 --Entrada 111
	 a <= '1';
	 b <= '1';
	 cin <= '1';
	 wait for 20 ns;
	 assert ((sum = '1') and (cout = '1')) --saida esperada
	 report "Teste falhou para a entrada 111" severity error;
     
	 wait; --suspende o processo indefinidamente
  end process;
end sim;
	 
	 
	 
	 
	 
	 