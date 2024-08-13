library ieee;
use ieee.std_logic_1164.all;

--bibliotecas para tratamento de arquivos
use ieee.std_logic_textio.all;
use std.textio.all;

--tesbech nao tem entradas e saidas
entity fulladder_tb2 is
end fulladder_tb2;

architecture sim of fulladder_tb2 is
  
  --importa o componente
  component fulladder is
    port(a, b, cin: in std_logic;
	      sum, cout: out std_logic);
  end component;
  
  -- sinais usados para conexao com o dut
  signal a, b, cin: std_logic;
  signal sum, cout: std_logic;
  
  --variaveis usadas para verificacao de resultados
  signal sum_esperada, cout_esperado: std_logic;
  
  
  -- para estabelecer tempo para leitura de entrada
  -- e verificacao de saida
  signal clk, reset: std_logic;
  
begin
  --instancia a unidade de teste
  DUT: fulladder port map(a=>a, b=>b, cin=>cin, sum=>sum, cout=>cout);
  
  --gera o clock
  -- process sem lista de sensibilidade funciona
  --como um looping infinito que roda em paralelo
  -- com outros process
  process
  begin
    clk <= '1';
	 wait for 10 ns;
	 clk <= '0';
	 wait for 10 ns;
  end process;
  
  -- inicialmente reseta,
  -- executa apenas uma vez
  process
  begin
    reset <= '1';
	 wait for 30 ns;
	 reset <= '0';
	 wait; -- espera infinita
  end process;
  
  -- roda os testes
  process
    file tv: text;
	 variable L: line;
	 variable vector_in: std_logic_vector(2 downto 0);
	 variable dummy: character;
	 variable vector_out: std_logic_vector(1 downto 0);
	 variable vectornum: integer := 0;
	 variable errors: integer := 0;
	 
	begin
	  FILE_OPEN(tv, "C:\Users\Aluno-labB27\Documents\fulladder_tb3\exemplo.tv", READ_MODE);
	  while not endfile(tv) loop
	    --le o vetor de entrada em clk=1
		 wait until rising_edge(clk);
		 readline(tv, L);
		 read(L, vector_in);
		 read(L, dummy);
		 read(L, vector_out);
		 (a, b, cin) <= vector_in(2 downto 0) after 1ns;
		 (sum_esperada, cout_esperado) <= vector_out(1 downto 0) after 1 ns;
		 
		  --verifica os resultados
		  wait until falling_edge(clk);
		  if (sum /= sum_esperada) or (cout /= cout_esperado) then
			 report "Erro: sum = "& std_logic'image(sum);
			 report "    : cout = "& std_logic'image(cout);
			 errors := errors + 1;
		  end if;
		  vectornum := vectornum + 1;
	  end loop;
	  
	  --sumariza os resultados
	  if (errors = 0) then
	    report "Finalizado com sucesso --!" & integer'image(vectornum) & "testes realizados"
		         severity failure;
	  else
	    report integer'image(vectornum) & " testes concluidos " &
		        integer'image(errors) severity failure;
	 end if;
	 wait;
	end process;
 end sim;