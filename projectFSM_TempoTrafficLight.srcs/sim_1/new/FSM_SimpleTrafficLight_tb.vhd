----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.10.2024 11:43:41
-- Design Name: 
-- Module Name: FSM_SimpleTrafficLight_tb - Behavioral
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

entity FSM_SimpleTrafficLight_tb is
--  Port ( );
end FSM_SimpleTrafficLight_tb;

architecture Behavioral of FSM_SimpleTrafficLight_tb is
    signal rst, clk : std_logic; -- Do not forget reset and clock!
    signal tempo : std_logic_vector(7 downto 0);
    signal V, O, R : std_logic;
    
    signal counter : integer := 0;
    
    constant clk_period : time := 5 ns;

    component FSM_SimpleTrafficLight
        port (  rst, clk : in std_logic; -- Do not forget reset and clock!
                tempo : in std_logic_vector(7 downto 0);
                V, O, R : out std_logic);
    end component;
begin
    top: FSM_SimpleTrafficLight port map(
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
    
    counter_process: process
    begin
        counter <= 0;
        tempo <= std_logic_vector(TO_UNSIGNED(counter, tempo'length));
        wait for 1 ns;
        
        loop
            counter <= counter + 1;
            wait for clk_period/2;
            tempo <= std_logic_vector(TO_UNSIGNED(counter, tempo'length));
        end loop;
    end process;
    
    stimulis: process
    begin
        rst <= '0';
        wait for 10 ns;
        
        wait;
        
    end process;


end Behavioral;
