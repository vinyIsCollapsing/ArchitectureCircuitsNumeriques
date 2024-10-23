----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.09.2024 15:34:37
-- Design Name: 
-- Module Name: c3 - Behavioral
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
-----------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity c3 is
port (r0:in std_logic;
    a,b: in std_logic_vector ( 3 downto 0);
    s: out std_logic_vector (4 downto 0));
end c3;

architecture archi of c3 is

signal r: std_logic_vector(4 downto 0);

component c2
    port(a,b,rin: in std_logic; s, rout: out std_logic);
end component;

begin

r(0)<=r0;
s(4)<=r(4);

boucle:for i in 0 to 3 generate
inst: c2 port map (rin =>r(i) , a=> a(i), b=> b(i), rout=>r(i+1),s=>s(i));
end generate;

end archi;
-----------------------------------