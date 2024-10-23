----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.10.2024 11:28:33
-- Design Name: 
-- Module Name: hex7seg_top - Behavioral
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

entity hex7seg_top is
    port (
        sw: in std_logic_vector( 3 downto 0 );
        seg: out std_logic_vector ( 0 to 6 );
        an: out std_logic_vector ( 3 downto 0);
        dp: out std_logic
    );
end hex7seg_top;

architecture Behavioral of hex7seg_top is
component hex7seg 
    port(
        hex: in std_logic_vector(3 downto 0);
        a_to_g: out std_logic_vector(6 downto 0)
    );
end component;
begin

    an<= "0000"; -- all digits on
    dp <= '1'; --dp off
      
    D4: hex7seg port map (hex => sw, a_to_g => seg);

end Behavioral;
