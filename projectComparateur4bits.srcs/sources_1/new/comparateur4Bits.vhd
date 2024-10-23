----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.09.2024 17:11:34
-- Design Name: 
-- Module Name: comparateur4Bits - Behavioral
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

entity comparateur4Bits is
    port( a, b: in std_logic_vector(3 downto 0);
        eq, gt, lt: out std_logic);
end comparateur4Bits;

architecture Behavioral of comparateur4Bits is

begin
    process(a, b)
    begin
        eq <= '0';
        gt <= '0';
        lt <= '0';
        if (a = b) then 
            eq <= '1';
        elsif (a > b) then
            gt <= '1';
        else
            lt <= '1';
        end if;
    end process;
end Behavioral;
