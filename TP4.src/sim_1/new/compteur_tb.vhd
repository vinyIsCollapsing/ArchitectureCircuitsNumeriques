----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.11.2024 15:25:14
-- Design Name: 
-- Module Name: compteur_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity compteur_tb is
end compteur_tb;

architecture Behavioral of compteur_tb is
    signal clk : std_logic := '0';
    signal reset : std_logic := '0';
    signal sortie : std_logic_vector(1 downto 0);
    
    component compteur
        port (  rst : in std_logic;
                clk : in std_logic;
                sortie : out std_logic_vector(1 downto 0)
        );
    end component;
begin
    uut: compteur
        port map ( clk => clk,
                   rst => reset,
                   sortie => sortie
        );
        
    clk_process :process
    begin
        clk <= '0';
        wait for 2.63 ms;
        clk <= '1';
        wait for 2.63 ms;
    end process;

    -- Processo de teste
    stimulus: process
    begin
        reset <= '1';
        wait for 5 ms;       
        reset <= '0';

        wait for 50 ms;

        wait;
    end process;

end Behavioral;
