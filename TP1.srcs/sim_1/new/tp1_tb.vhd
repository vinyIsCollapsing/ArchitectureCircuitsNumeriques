----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.10.2024 10:45:35
-- Design Name: 
-- Module Name: tp1_tb - Behavioral
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

entity tp1_tb is
--  Port ( );
end tp1_tb;

architecture Behavioral of tp1_tb is
    signal swt : STD_LOGIC_VECTOR (7 downto 0);
    signal led : std_logic_vector(7 downto 0);
    
    signal counter : integer := 0;
    
    component tp1
    port( swt : in STD_LOGIC_VECTOR (7 downto 0);
           led : out std_logic_vector(7 downto 0)
    );
    end component;
begin
    top: tp1 port map(
        swt => swt,
        led => led
    );
    
    display_process: process
    begin

            counter <= counter + 1;
            swt <= std_logic_vector(TO_UNSIGNED(counter, swt'length));
            wait for 1 ns;

    end process;

end Behavioral;
