----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.11.2024 14:50:04
-- Design Name: 
-- Module Name: compteur - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity compteur is
    port (  rst : in std_logic;
            clk : in std_logic;
            sortie : out std_logic_vector(1 downto 0)
    );
end compteur;

architecture Behavioral of compteur is
    signal count : std_logic_vector(1 downto 0) := "00";
begin
    process(clk, rst)
    begin
        if rst = '1' then
            count <= "00";
        elsif rising_edge(clk) then
            count <= count + 1;
        end if;
    end process;
    
    sortie <= count;
end Behavioral;