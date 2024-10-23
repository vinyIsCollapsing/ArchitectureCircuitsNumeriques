----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.09.2024 16:29:49
-- Design Name: 
-- Module Name: decoder38 - Behavioral
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

entity decoder38 is
    port(
        a: in std_logic_vector(2 downto 0);
        s: out std_logic_vector(7 downto 0)
    );
end decoder38;

architecture Behavioral of decoder38 is
begin
    process(a)
    begin
        case a is
            when "000" => s <= "00000001";
            when "001" => s <= "00000010";
            when "010" => s <= "00000100";
            when "011" => s <= "00001000";
            when "100" => s <= "00010000";
            when "101" => s <= "00100000";
            when "110" => s <= "01000000";
            when "111" => s <= "10000000";
            when others => s <= "00000000";
        end case;
    end process;

end Behavioral;
