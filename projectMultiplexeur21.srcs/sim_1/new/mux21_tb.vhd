----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.09.2024 16:00:53
-- Design Name: 
-- Module Name: mux21_tb - Behavioral
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

entity mux21_tb is
--  Port ( );
end mux21_tb;

architecture Behavioral of mux21_tb is
        signal a, b, s: std_logic;
        signal y: std_logic;
component mux21
    port( a, b, s: in std_logic;
        y: out std_logic);
end component;

begin
    top: mux21 port map (
        a => a,
        b => b,
        s => s,
        y => y
    );
    
    stimulis: process
    begin
        a <= '0';
        b <= '1';
        s <= '0';
        wait for 30 ns;
        
        s <= '1';
        wait for 30 ns;
        wait;
    end process;


end Behavioral;
