----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.09.2024 14:34:56
-- Design Name: 
-- Module Name: adder4bits - Behavioral
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


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity adder4bits is
    port(
        a, b: in std_logic_vector(3 downto 0);
        s: out std_logic_vector(3 downto 0);
        cf, ovf: out std_logic
    );
end adder4bits;

architecture Behavioral of adder4bits is
begin
     process(a, b)
         variable temp: unsigned(4 downto 0);
     begin
         temp := unsigned('0' & a) + unsigned('0' & b);
         s <= std_logic_vector(temp(3 downto 0));
         cf <= temp(4);
         ovf <= temp(3) xor a(3) xor b(3) xor temp(4);
     end process;
end Behavioral;
