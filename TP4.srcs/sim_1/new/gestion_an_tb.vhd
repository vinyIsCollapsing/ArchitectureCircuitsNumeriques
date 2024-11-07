----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.11.2024 16:50:48
-- Design Name: 
-- Module Name: gestion_an_tb - Behavioral
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

entity gestion_an_tb is
end gestion_an_tb;

architecture Behavioral of gestion_an_tb is
    signal rst : std_logic := '0';
    signal sortie : std_logic_vector(1 downto 0) := "00";
    signal an : std_logic_vector(3 downto 0);
    
    component gestion_an
        port (  sortie : in std_logic_vector(1 downto 0);   -- Entree de compteur
            rst : in std_logic;
            an : out std_logic_vector(3 downto 0)
    );
    end component;
begin
    uut: Gestion_an
        Port map ( rst => rst,
                   sortie => sortie,
                   an => an);
    stimulus: process
    begin
        rst <= '1';
        wait for 10 ns;

        rst <= '0';
        wait for 10 ns;

        sortie <= "00";
        wait for 10 ns;

        sortie <= "01";
        wait for 10 ns;

        sortie <= "10";
        wait for 10 ns;

        sortie <= "11";
        wait for 10 ns;

        rst <= '1';
        wait for 10 ns;

        wait;
    end process;

end Behavioral;
