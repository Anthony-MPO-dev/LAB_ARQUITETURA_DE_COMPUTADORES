library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity test_add is
end test_add;

architecture sim of test_add is
    -- Declara o componente add_component
    component add_component is
        Port (
            A     : in  STD_LOGIC_VECTOR (31 downto 0);
            B     : in  STD_LOGIC_VECTOR (31 downto 0);
            Sum   : out STD_LOGIC_VECTOR (31 downto 0)
        );
    end component;
    
    -- Sinais para conectar o DUT
    signal A     : STD_LOGIC_VECTOR (31 downto 0);
    signal B     : STD_LOGIC_VECTOR (31 downto 0);
    signal Sum   : STD_LOGIC_VECTOR (31 downto 0);

begin
    -- Instancia o DUT
    DUT: add_component port map(
        A     => A,
        B     => B,
        Sum   => Sum
    );

    process
    begin
        -- Teste 1: 1 + 1
        A <= (others => '0'); -- 0 em 32 bits
        B <= (others => '0'); -- 0 em 32 bits
        A(0) <= '1';          -- A = 1
        B(0) <= '1';          -- B = 1
		  wait for 20 ns;
        assert (Sum = "00000000000000000000000000000010") -- Esperado: 2 (em binário)
            report "Teste falhou para 1 + 1" severity error;

        -- Teste 2: 2 + 2
        A <= (others => '0'); -- 0 em 32 bits
        B <= (others => '0'); -- 0 em 32 bits
        A(1) <= '1';          -- A = 2
        B(1) <= '1';          -- B = 2
        wait for 20 ns;
        assert (Sum = "00000000000000000000000000000100") -- Esperado: 4 (em binário)
            report "Teste falhou para 2 + 2" severity error;
        
        -- Teste 3: 2 + 3
        A <= (others => '0'); -- 0 em 32 bits
        B <= (others => '0'); -- 0 em 32 bits
        A(1) <= '1';          -- A = 2
        B(0) <= '1';          -- B = 3 (em binário: 00000000000000000000000000000011)
        B(1) <= '1';          -- B = 3 (em binário: 00000000000000000000000000000011)
        wait for 20 ns;
        assert (Sum = "00000000000000000000000000000101") -- Esperado: 5 (em binário)
            report "Teste falhou para 2 + 3" severity error;
        
        -- Encerrar a simulação
        wait;
    end process;
end sim;