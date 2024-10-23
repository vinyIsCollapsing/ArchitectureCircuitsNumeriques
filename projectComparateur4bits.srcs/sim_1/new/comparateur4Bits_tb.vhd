----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.09.2024 17:26:37
-- Design Name: 
-- Module Name: comparateur4Bits_tb - Behavioral
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

entity comparateur4Bits_tb is
--  Port ( );
end comparateur4Bits_tb;

architecture Behavioral of comparateur4Bits_tb is
    signal a, b: std_logic_vector(3 downto 0);
    signal eq, gt, lt: std_logic;
component comparateur4Bits
    port(   a, b: in std_logic_vector(3 downto 0);
            eq, gt, lt: out std_logic);
end component;

begin
    top: comparateur4Bits port map(
        a => a, 
        b => b,
        eq => eq, 
        gt => gt, 
        lt => lt);
        
    stimulis: process
    begin
        a <= "0000";
        b <= "0000";
        wait for 50 ns;
        a <= "1000";
        b <= "0000";
        wait for 50 ns;
        a <= "0000";
        b <= "1000";
        wait for 50 ns;
        wait;
    end process;
end Behavioral;
