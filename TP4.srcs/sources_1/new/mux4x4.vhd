library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux4x4 is
    Port ( E1 : in STD_LOGIC_VECTOR(3 downto 0);   -- Primeiro d�gito
           E2 : in STD_LOGIC_VECTOR(3 downto 0);   -- Segundo d�gito
           E3 : in STD_LOGIC_VECTOR(3 downto 0);   -- Terceiro d�gito
           E4 : in STD_LOGIC_VECTOR(3 downto 0);   -- Quarto d�gito
           sortie : in STD_LOGIC_VECTOR(1 downto 0); -- Entrada de sele��o de 2 bits
           data_out : out STD_LOGIC_VECTOR(3 downto 0)); -- Sa�da de 4 bits (um d�gito)
end mux4x4;

architecture Behavioral of mux4x4 is
begin
    process(sortie, E1, E2, E3, E4)
    begin
        case sortie is
            when "00" => data_out <= E1; -- Seleciona o primeiro d�gito
            when "01" => data_out <= E2; -- Seleciona o segundo d�gito
            when "10" => data_out <= E3; -- Seleciona o terceiro d�gito
            when "11" => data_out <= E4; -- Seleciona o quarto d�gito
            when others => data_out <= "0000"; -- Situa��o de seguran�a
        end case;
    end process;
end Behavioral;
