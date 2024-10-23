library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity clkdiv_tb is
--  Port ( );
end clkdiv_tb;

architecture Behavioral of clkdiv_tb is
    signal clk_in, rst, clk_out : std_logic;
    constant clk_period : time := 10 ns;  -- Período de 10 ns para 100 MHz
    signal counter : integer := 0;        -- Contador para ciclos de clock
 
    component clkdiv
        port (  rst : in std_logic;
                mclk : in std_logic;        -- Clock de 100Mhz
                clk190 : out std_logic      -- Clock de 190Hz
         );
    end component;
    
begin
    -- Instancia o divisor de clock
    uut: clkdiv port map(
        mclk => clk_in,
        rst => rst,
        clk190 => clk_out
    );
    
    -- Gerador de Clock de 100 MHz
    clk_process: process
    begin
        clk_in <= '0';
        wait for clk_period / 2;
        clk_in <= '1';
        wait for clk_period / 2;
    end process;
    
    -- Processo de Teste
    test_process: process
    begin
        -- Reset
        rst <= '1';
        wait for clk_period * 2;
        rst <= '0';
        
        -- Contar ciclos de clk_in até uma borda de clk_out
        wait until rising_edge(clk_out);
        counter <= 0;
       
        -- Fim da simulação
        wait;
    end process;
end Behavioral;
