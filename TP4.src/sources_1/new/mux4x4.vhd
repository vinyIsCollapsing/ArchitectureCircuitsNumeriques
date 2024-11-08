library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux4x4 is
    Port ( E1 : in std_logic_vector(3 downto 0);   -- Primeiro dígito
           E2 : in std_logic_vector(3 downto 0);   -- Segundo dígito
           E3 : in std_logic_vector(3 downto 0);   -- Terceiro dígito
           E4 : in std_logic_vector(3 downto 0);   -- Quarto dígito
           sortie : in std_logic_vector(1 downto 0); -- Entrada de seleção de 2 bits
           data_out : out std_logic_vector(3 downto 0)); -- Saída de 4 bits (um dígito)
end mux4x4;

architecture Behavioral of mux4x4 is
begin
    process(sortie, E1, E2, E3, E4)
    begin
        case sortie is
            when "00" => data_out <= E1; -- Seleciona o primeiro dígito
            when "01" => data_out <= E2; -- Seleciona o segundo dígito
            when "10" => data_out <= E3; -- Seleciona o terceiro dígito
            when "11" => data_out <= E4; -- Seleciona o quarto dígito
            when others => data_out <= "0000"; -- Situação de segurança
        end case;
    end process;
end Behavioral;
