----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.10.2024 10:29:13
-- Design Name: 
-- Module Name: tp1 - Behavioral
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

entity tp1 is
    Port ( swt : in STD_LOGIC_VECTOR (7 downto 0);
           led : out std_logic_vector(7 downto 0)
    );
end tp1;

architecture Behavioral of tp1 is

begin
    process(swt)
    begin
        led(0) <= not swt(0);
        led(1) <= swt(1) and (not swt(2));
        led(2) <= (swt(1) and (not swt(2))) or (swt(2) and swt(3));
        led(3) <= swt(2) and swt(3);
        led(7 downto 4) <= swt(7 downto 4);
    end process;

end Behavioral;
