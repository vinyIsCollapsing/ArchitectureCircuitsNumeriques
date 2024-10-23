----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.09.2024 17:36:51
-- Design Name: 
-- Module Name: flipFlopD_tb - Behavioral
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

entity flipFlopD_tb is
--  Port ( );
end flipFlopD_tb;

architecture Behavioral of flipFlopD_tb is
    signal clk, d: std_logic;
    signal q: std_logic;
component flipFlopD
    port (  clk, d: in std_logic;
            q: out std_logic);
end component;

begin
    top: flipFlopD port map(
        clk => clk,
        d => d,
        q => q
    );
    
    stimulis: process
    begin
        clk <= '0';
        d <= '0';
        wait for 10 ns;
        
        d <= '1';
        clk <= '1';
        wait for 10 ns;
    end process;
end Behavioral;
