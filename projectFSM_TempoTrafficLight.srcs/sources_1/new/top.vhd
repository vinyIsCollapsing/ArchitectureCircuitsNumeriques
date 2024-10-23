----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.10.2024 12:51:09
-- Design Name: 
-- Module Name: top - Behavioral
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

entity top is
    port (  clk, rst : in std_logic; 
            V, O, R : out std_logic
    );
end top;

architecture Behavioral of top is
    signal countToTempo : std_logic_vector(7 downto 0);
begin
    u1: entity work.CompteurModule
        port map(
            clk => clk,
            rst => rst,
            count => countToTempo
        );
        
    u2: entity work.FSM_SimpleTrafficLight
        port map (
            rst => rst, 
            clk => clk,
            tempo => countToTempo,
            V => V, 
            O => O,
            R => R
        );


end Behavioral;
