library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_unsigned.all;

entity top_tb is
end top_tb;

architecture Behavioral of top_tb is
    -- Sinal para a entidade top
    signal mclk : std_logic := '0';
    signal btn : std_logic_vector(3 downto 0) := (others => '0');
    signal sw : std_logic_vector(7 downto 0) := (others => '0');
    signal led : std_logic_vector(1 downto 0);

    -- Instancia��o do componente top
    component top
        port(
            mclk : in std_logic;
            btn : in std_logic_vector(3 downto 0);
            sw : in std_logic_vector(7 downto 0);
            led : out std_logic_vector(1 downto 0)
        );
    end component;

begin
    -- Instanciando a entidade top
    uut: top port map(
        mclk => mclk,
        btn => btn,
        sw => sw,
        led => led
    );

    -- Gerador de Clock de 100 MHz
    clk_process: process
    begin
        mclk <= '0';
        wait for 5 ns;
        mclk <= '1';
        wait for 5 ns;
    end process;

    -- Est�mulo das entradas
    stimulus_process : process
    begin
        -- Ativa o reset e depois desativa
        btn(3) <= '1';
        wait for 10 ns;
        btn(3) <= '0';
        wait for 10 ns;
        
        sw <= "00000000";
        wait for 5.3 * 10 ms;

        -- Estimula os bot�es de entrada e altera os switches
        btn(0) <= '1';  -- Ativando bot�o 0
        wait for 10.6 ms;
        btn(0) <= '0';
        wait for 10.6 ms;
        
        btn(0) <= '1';  -- Ativando bot�o 0
        wait for 10.6 ms;
        btn(0) <= '0';
        wait for 10.6 ms;
        
        btn(0) <= '1';  -- Ativando bot�o 0
        wait for 10.6 ms;
        btn(0) <= '0';
        wait for 10.6 ms;
        
        btn(0) <= '1';  -- Ativando bot�o 0
        wait for 10.6 ms;
        btn(0) <= '0';
        wait for 10.6 ms;

        --btn(1) <= '1';  -- Ativando bot�o 1
        --wait for 20 ns;
        --btn(1) <= '0';

        --btn(2) <= '1';  -- Ativando bot�o 2
        --wait for 20 ns;
        --btn(2) <= '0';

        -- Alterando valores dos switches para simular diferentes combina��es
        --sw <= "11001100";
        --wait for 100 ns;
    end process;

end Behavioral;
