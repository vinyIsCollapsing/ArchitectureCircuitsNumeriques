----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.09.2024 17:18:51
-- Design Name: 
-- Module Name: c1 - Behavioral
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

entity c1 is
    Port ( e1 : in STD_LOGIC;
           e2 : in STD_LOGIC;
           s1 : out STD_LOGIC;
           s2 : out STD_LOGIC);
end c1;

architecture Behavioral of c1 is

begin
    s1 <= e1 xor e2;
    s2 <= e1 and e2;
end Behavioral;
