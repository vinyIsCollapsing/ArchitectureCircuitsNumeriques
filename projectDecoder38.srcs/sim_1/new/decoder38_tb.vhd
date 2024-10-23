----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.09.2024 16:30:29
-- Design Name: 
-- Module Name: decoder38_tb - Behavioral
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

entity decoder38_tb is
--  Port ( );
end decoder38_tb;

architecture Behavioral of decoder38_tb is
        signal a: std_logic_vector(2 downto 0);
        signal s: std_logic_vector(7 downto 0);
component decoder38
    port (
        a: in std_logic_vector(2 downto 0);
        s: out std_logic_vector(7 downto 0)
    );
end component;
begin
    top: decoder38 port map(
        a => a,
        s => s
    );
    
    stimulis: process
    begin
        for i in 0 to 7 loop
            a <= std_logic_vector(to_unsigned(i, 3));
            wait for 30 ns;
        end loop;
        wait;
    end process;

end Behavioral;
