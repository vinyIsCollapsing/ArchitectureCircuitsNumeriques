library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_top is
end tb_top;

architecture Behavioral of tb_top is

    signal mclk : std_logic := '0';
    signal btn  : std_logic_vector(3 downto 0) := "0000"; 
    signal an   : std_logic_vector(3 downto 0);
    signal a_to_g : std_logic_vector(6 downto 0);

    constant CLOCK_PERIOD : time := 10 ns;

begin

    uut: entity work.top
        port map (
            mclk => mclk,
            btn => btn,
            an => an,
            a_to_g => a_to_g
        );

    clk_process : process
    begin
        mclk <= '0';
        wait for CLOCK_PERIOD / 2;
        mclk <= '1';
        wait for CLOCK_PERIOD / 2;
    end process clk_process;

    stimulus_process : process
    begin
        btn(3) <= '1';
        wait for 100 ns;

        btn(3) <= '0';
        wait for 500 ns;

        btn(3) <= '1';
        wait for 100 ns;
        btn(3) <= '0';

        wait for 1000 ns;
        
        wait;
    end process stimulus_process;

end Behavioral;
