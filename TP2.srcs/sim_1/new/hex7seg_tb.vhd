----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.10.2024 11:25:01
-- Design Name: 
-- Module Name: hex7seg_tb - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity hex7seg_tb is
--  Port ( );
end hex7seg_tb;

architecture Behavioral of hex7seg_tb is
    signal hex: std_logic_vector(3 downto 0);
    signal a_to_g: std_logic_vector(6 downto 0);
    
    signal counter : integer := 0;
    
    component hex7seg     
    port (
        hex: in std_logic_vector(3 downto 0);
        a_to_g: out std_logic_vector(6 downto 0)
    );
    end component;
begin
    u1: hex7seg port map (
        hex => hex,
        a_to_g => a_to_g
    );
    
    hex_process: process
    begin
        counter <= counter + 1;
        hex <= std_logic_vector(TO_UNSIGNED(counter, hex'length));
        wait for 1 ns;
    end process;


end Behavioral;
