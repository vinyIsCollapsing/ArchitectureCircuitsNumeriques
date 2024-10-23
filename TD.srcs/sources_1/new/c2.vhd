----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.09.2024 17:33:36
-- Design Name: 
-- Module Name: c2 - Behavioral
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

entity c2 is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           rin : in STD_LOGIC;
           rout : out STD_LOGIC;
           s : out STD_LOGIC);
end c2;

architecture Behavioral of c2 is

component c1
    port (e1,e2: in std_logic; s1,s2:out std_logic);
end component;

signal signal1,signal2,signal3: std_logic;

begin
    instance1: c1 port map(e1=>a,e2=>b,s1=>signal1,s2=>signal2);
    instance2: c1 port map(e1=>signal1,e2=>rin,s1=>s,s2=>signal3);

    rout <= signal2 or signal3;

end Behavioral;
