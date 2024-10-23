library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clock_pulse is
    port ( clk : in std_logic;        -- Clock de 190 Hz
           rst : in std_logic;        -- Reset
           entree : in std_logic;     -- Entrada do botão
           sortie : out std_logic     -- Pulso de saída
         );
end clock_pulse;

architecture Behavioral of clock_pulse is
    signal retard1, retard2, retard3 : std_logic := '0';
    
    component FlipFlopD 
        port (  clk, rst, d:in std_logic;
                q: out std_logic
        );
    end component;
begin
    FF1: FlipFlopD port map(clk => clk, rst => rst, d => entree, q => retard1);
    FF2: FlipFlopD port map(clk => clk, rst => rst, d => retard1, q => retard2);
    FF3: FlipFlopD port map(clk => clk, rst => rst, d => retard2, q => retard3);
    
    sortie <= retard1 AND retard2 AND (NOT(retard3));
end Behavioral;
