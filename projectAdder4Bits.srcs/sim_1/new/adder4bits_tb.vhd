----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.09.2024 14:38:30
-- Design Name: 
-- Module Name: adder4bits_tb - Behavioral
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

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity adder4bits_tb is
--  Port ( );
end adder4bits_tb;

architecture Behavioral of adder4bits_tb is

        signal a, b: std_logic_vector(3 downto 0);
        signal s:  std_logic_vector(3 downto 0);
        signal cf, ovf:  std_logic;
component adder4bits
        port (  
            a,b : in std_logic_vector(3 downto 0); 
            s: out std_logic_vector(3 downto 0);
            cf, ovf: out std_logic);
end component;

begin
    top: adder4bits port map(
        a => a,
        b => b,
        s => s,
        cf => cf,
        ovf => ovf
    );
    stimulis: process
    begin
    
        a <= "0000";
        b <= "0000";
        wait for 50 ns;
        
        a <= "1010";
        b <= "0101";
        wait for 50 ns;
        
        a <= "1111";
        b <= "0001";
        wait for 50 ns;
        
        a <= "0111";
        b <= "0111";
        wait for 50 ns;

    
    wait;
    
    end process;


end Behavioral;
