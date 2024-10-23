----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.09.2024 16:31:52
-- Design Name: 
-- Module Name: FSM_tb - Behavioral
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

entity FSM_tb is
--  Port ( );
end FSM_tb;

architecture Behavioral of FSM_tb is
    signal rst, clk : std_logic; -- Do not forget reset and clock!
    signal tempo: std_logic_vector(7 downto 0);
    signal V, O, R : std_logic;
    
    constant clk_period : time := 5 ns;
component FSM
    port (  rst, clk : in std_logic; -- Do not forget reset and clock!
            tempo: std_logic_vector(7 downto 0);
            V, O, R : out std_logic);
end component;

    component CompteurModule
        port (
            clk : in std_logic;
            rst : in std_logic; -- Consider if asynchronous reset is needed
            count : out std_logic_vector(7 downto 0)
        );
    end component;

begin
    top: FSM port map(
        rst => rst,
        clk => clk,
        V => V,
        O => O,
        R => R,
        tempo => tempo
    );
    
    clk_process :process
    begin
        clk <= '0';
        wait for clk_period/2; 

    	clk <= '1';
    	wait for clk_period/2;
    end process;
    
    stimulis: process
    begin
        --rst <= '0';

        
    end process;
end Behavioral;
