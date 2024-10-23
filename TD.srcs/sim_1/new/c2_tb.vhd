----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.09.2024 17:46:48
-- Design Name: 
-- Module Name: c2_tb - Behavioral
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

entity c2_tb is
--  Port ( );
end c2_tb;

architecture Behavioral of c2_tb is
signal entree1,entree2,entree3,sortie1,sortie2:std_logic;

component c1
    port (e1,e2: in std_logic; s1,s2:out std_logic);
end component;
component c2
    port (a,b,rin: in std_logic; rout,s:out std_logic);
end component;

begin
    top:c2
        port map(a => entree1,b=>entree2, rin => entree3, rout=>sortie1,s=>sortie2);
    stimulis: process
    begin
        entree1<='0'; entree2<='0';entree3<='0';
        wait for 30 ns; entree3<='1';
        wait for 30 ns; entree2<='1';entree3<='0';
        wait for 30 ns; entree3<='1';
        wait for 30 ns; entree1<='1';entree2<='0';entree3<='0';
        wait for 30 ns; entree3<='1';
        wait for 30 ns; entree2<='1';entree3<='0';
        wait for 30 ns; entree3<='1';
        wait for 30 ns;
    end process;


end Behavioral;
