library ieee;
use ieee.std_logic_1164.all;

entity hex7seg_top is
  port(
    sw: in std_logic_vector( 3 downto 0 );
    seg: out std_logic_vector ( 0 to 6 );
    an: out std_logic_vector ( 3 downto 0);
    dp: out std_logic);
end hex7seg_top;

architecture archi of hex7seg_top is 

component hex7seg 
  port(
    hex: in std_logic_vector(3 downto 0);
    a_to_g: out std_logic_vector(6 downto 0));
end component;

begin
  
  an<= "0000"; -- all digits on
  dp <= '1'; --dp off
  
  D4: hex7seg port map (hex => sw, a_to_g => seg);
  
end archi;