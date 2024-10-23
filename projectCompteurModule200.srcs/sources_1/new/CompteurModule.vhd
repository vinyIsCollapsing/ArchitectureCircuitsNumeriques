----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.09.2024 15:24:04
-- Design Name: 
-- Module Name: CompteurModule - Behavioral
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
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CompteurModule is
    port (
        clk : in std_logic;
        rst : in std_logic; -- Consider if asynchronous reset is needed
        count : out std_logic_vector(7 downto 0)
    );
end CompteurModule;

architecture Behavioral of CompteurModule is

begin
    process(clk, rst)
    variable temp_count : unsigned(7 downto 0) := (others => '0');
    begin
        if rst = '1' then
            temp_count := (others => '0'); -- Asynchronous reset
        elsif rising_edge(clk) then
            if temp_count = 199 then
                temp_count := (others => '0'); -- Reset the counter on reaching 199
            else
                temp_count := temp_count + 1;
            end if;
        end if;
        count <= std_logic_vector(temp_count);
    end process;

end Behavioral;
