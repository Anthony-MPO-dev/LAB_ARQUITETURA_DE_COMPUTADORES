library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity add_component is
    Port (
        A     : in  STD_LOGIC_VECTOR (31 downto 0);
        B     : in  STD_LOGIC_VECTOR (31 downto 0);
        Sum   : out STD_LOGIC_VECTOR (31 downto 0)
    );
end add_component;

architecture Behavioral of add_component is
begin
    process (A, B)
    begin
        -- Converter A e B para tipo signed
        -- Realizar a soma
        -- Converter o resultado para tipo STD_LOGIC_VECTOR
        Sum <= std_logic_vector(signed(A) + signed(B));
    end process;
end Behavioral;