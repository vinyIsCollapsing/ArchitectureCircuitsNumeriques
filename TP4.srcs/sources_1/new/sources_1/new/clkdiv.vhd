library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clkdiv is
    port (  rst : in std_logic;
            clk : in std_logic;        -- Clock de 100Mhz
            clk190 : out std_logic      -- Clock de 190Hz
     );
end clkdiv;

architecture Behavioral of clkdiv is
    signal counter : std_logic_vector(23 downto 0) := (others => '0');
begin
    process(clk, rst)
    begin
        if rst = '1' then
            counter <= (others => '0');
        elsif rising_edge(clk) then
            counter <= counter + 1;
        end if;
    end process;
    
    clk190 <= counter(18);              -- 100 Mhz / 2^(18+1) = 190,73 Hz

end Behavioral;
