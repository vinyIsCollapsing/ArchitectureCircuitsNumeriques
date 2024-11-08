library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_mux4x4 is
end tb_mux4x4;

architecture Behavioral of tb_mux4x4 is
    -- Sinais para simulação
    signal E1, E2, E3, E4 : std_logic_vector(3 downto 0);
    signal sortie : std_logic_vector(1 downto 0);
    signal data_out : std_logic_vector(3 downto 0);

    -- Instância do módulo a ser testado
    component mux4x4
        Port ( E1 : in std_logic_vector(3 downto 0);
               E2 : in std_logic_vector(3 downto 0);
               E3 : in std_logic_vector(3 downto 0);
               E4 : in std_logic_vector(3 downto 0);
               sortie : in std_logic_vector(1 downto 0);
               data_out : out std_logic_vector(3 downto 0));
    end component;

begin
    uut: mux4x4
        Port map ( E1 => E1,
                   E2 => E2,
                   E3 => E3,
                   E4 => E4,
                   sortie => sortie,
                   data_out => data_out);

    stimulus: process
    begin
        -- Definir valores para E1, E2, E3, E4
        E1 <= "0001";  -- Representa o dígito 1
        E2 <= "0010";  -- dígito 2
        E3 <= "0011";  -- dígito 3
        E4 <= "0100";  -- dígito 4

        sortie <= "00";
        wait for 10 ns;

        sortie <= "01";
        wait for 10 ns;

        sortie <= "10";
        wait for 10 ns;

        sortie <= "11";
        wait for 10 ns;

        wait;
    end process;

end Behavioral;
