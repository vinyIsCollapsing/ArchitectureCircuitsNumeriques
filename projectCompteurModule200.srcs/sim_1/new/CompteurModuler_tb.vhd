----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.09.2024 15:27:07
-- Design Name: 
-- Module Name: CompteurModuler_tb - Behavioral
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

entity CompteurModuler_tb is
--  Port ( );
end CompteurModuler_tb;

architecture Behavioral of CompteurModuler_tb is
    signal clk : std_logic;
    signal rst : std_logic; -- Consider if asynchronous reset is needed
    signal count : std_logic_vector(7 downto 0);

    constant clk_period : time := 5 ns;

component CompteurModule
    port (
        clk : in std_logic;
        rst : in std_logic; -- Consider if asynchronous reset is needed
        count : out std_logic_vector(7 downto 0)
    );
end component;
begin
    comp: CompteurModule port map(
        clk => clk,
        rst => rst,
        count => count
    );
    
    stimulis: process
    begin
        rst <= '0';
        clk <= '0';
    	wait for clk_period/2; 

        clk <= '1';
    	wait for clk_period/2;
    end process;

end Behavioral;
