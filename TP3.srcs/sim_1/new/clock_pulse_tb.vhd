library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clock_pulse_tb is
end clock_pulse_tb;

architecture Behavioral of clock_pulse_tb is
    signal clk, rst, entree, sortie : std_logic;
    constant clk_period : time := 10 ns; 

    component clock_pulse
        Port ( clk : in std_logic;
               rst : in std_logic;
               entree : in std_logic;
               sortie : out std_logic );
    end component;

begin
    -- Instancia o clock_pulse
    uut: clock_pulse port map(
        clk => clk,
        rst => rst,
        entree => entree,
        sortie => sortie
    );

    -- Gera o clock de 190 Hz
    clk_process: process
    begin
        clk <= '0';
        wait for clk_period / 2;
        clk <= '1';
        wait for clk_period / 2;
    end process;
   
    -- Inicializa��o do Reset
    rst <= '1', '0' after 25ns;

    -- Est�mulos de teste
    stim_proc: process
    begin
        -- Teste de Pulso com o bot�o pressionado
        entree <= '1';
        wait for clk_period * 2;  -- Mant�m o bot�o pressionado por um ciclo de clock
        entree <= '0';
        wait for clk_period * 2;  -- Mant�m o bot�o solto por um ciclo de clock
    end process;

end Behavioral;
