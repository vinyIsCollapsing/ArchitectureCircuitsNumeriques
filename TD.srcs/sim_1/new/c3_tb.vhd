----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.09.2024 15:42:27
-- Design Name: 
-- Module Name: c3_tb - Behavioral
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

entity c3_tb is
--  Port ( );
end c3_tb;

architecture Behavioral of c3_tb is
    signal r0: std_logic;
    signal a, b: std_logic_vector(3 downto 0);
    signal s: std_logic_vector(4 downto 0);
component c3
    port (  r0: in std_logic; 
            a,b : in std_logic_vector(3 downto 0); 
            s: out std_logic_vector(4 downto 0));
end component;

begin
    instance3: c3 port map (
        r0 =>r0,
        a=> a, 
        b=> b, 
        s=>s);
        
    stimulis: process
    begin
        r0 <= '0';
        a <= "0010";
        b <= "0010";
        wait for 30 ns;
        
        r0 <= '1';
        a <= "0010";
        b <= "0010";
        wait for 30 ns;
        
        wait;
        
    end process; 
end Behavioral;
