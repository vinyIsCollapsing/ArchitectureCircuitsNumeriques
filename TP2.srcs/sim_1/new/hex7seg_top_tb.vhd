----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.10.2024 12:33:03
-- Design Name: 
-- Module Name: hex7seg_top_tb - Behavioral
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

entity hex7seg_top_tb is
--  Port ( );
end hex7seg_top_tb;

architecture Behavioral of hex7seg_top_tb is
        signal sw: std_logic_vector( 3 downto 0 );
        signal seg: std_logic_vector ( 0 to 6 );
        signal an: std_logic_vector ( 3 downto 0);
        signal dp: std_logic;
        
        signal counter : integer := 0;
        
        component hex7seg_top
        port (
            sw: in std_logic_vector( 3 downto 0 );
            seg: out std_logic_vector ( 0 to 6 );
            an: out std_logic_vector ( 3 downto 0);
            dp: out std_logic
        );
        end component;
begin


end Behavioral;
