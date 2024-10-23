----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.10.2024 10:00:13
-- Design Name: 
-- Module Name: digicode_control_tb - Behavioral
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

entity digicode_control_tb is
--  Port ( );
end digicode_control_tb;

architecture Behavioral of digicode_control_tb is
    signal rst, clk : std_logic;
    signal bn : std_logic_vector(0 to 1);
    signal sw : std_logic_vector(7 downto 0);
    signal pass, fail : std_logic;
    
    constant clk_period : time := 5 ns;
    
    component digicode_control
    port(   rst, clk : in std_logic;
            bn : in std_logic_vector(0 to 1);
            sw : in std_logic_vector(7 downto 0);
            pass, fail : out std_logic
    );
    end component;
    
begin
    uu1: digicode_control port map(
        rst => rst,
        clk => clk,
        bn => bn,
        sw => sw,
        pass => pass,
        fail => fail
    );
    
    clk_process: process
    begin
        clk <= '0';
        wait for clk_period/2; 

    	clk <= '1';
    	wait for clk_period/2;
    end process;
    
    stimulis: process
    begin
        rst <= '0';
        sw <= "00011000";
        
        bn <= "00";
        wait for clk_period; 
        
        bn <= "01";
        wait for clk_period; 
        
        bn <= "10";
        wait for clk_period; 
    end process;

end Behavioral;
