----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.09.2024 17:36:31
-- Design Name: 
-- Module Name: flipFlopD - Behavioral
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

entity flipFlopD is
port (  clk, d:in std_logic;
        q: out std_logic);
end flipFlopD;

architecture Behavioral of flipFlopD is
begin
    process(clk)
    begin
        if clk'event and clk = '1' then
            q <= d;
        end if;
    end process;
end Behavioral;
