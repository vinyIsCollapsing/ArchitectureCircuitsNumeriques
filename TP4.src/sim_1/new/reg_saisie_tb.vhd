library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_reg_saisie is
end tb_reg_saisie;

architecture Behavioral of tb_reg_saisie is
    component reg_saisie
        Port (
            clk    : in  std_logic;
            rst  : in  std_logic;
            btn    : in  std_logic_vector(2 downto 0);
            en     : in  std_logic;
            E1     : out std_logic_vector(3 downto 0);
            E2     : out std_logic_vector(3 downto 0);
            E3     : out std_logic_vector(3 downto 0);
            E4     : out std_logic_vector(3 downto 0)
        );
    end component;

    signal clk       : std_logic := '0';
    signal reset     : std_logic := '0';
    signal btn       : std_logic_vector(2 downto 0) := "000";
    signal en        : std_logic := '0';
    signal E1, E2, E3, E4 : std_logic_vector(3 downto 0);

    constant clk_period : time := 10 ns;

begin
    regSaisie: reg_saisie Port map (
        clk => clk,
        rst => reset,
        btn => btn,
        en => en,
        E1 => E1,
        E2 => E2,
        E3 => E3,
        E4 => E4
    );

    clk_process :process
    begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process;

    stimulus: process
    begin
        reset <= '1';
        wait for clk_period;
        reset <= '0';

        en <= '1';
        btn <= "001";  
        wait for clk_period;
        btn <= "000";  

        wait for clk_period;
        btn <= "010"; 
        wait for clk_period;
        btn <= "000"; 

        wait for clk_period;
        btn <= "100";  
        wait for clk_period;
        btn <= "000"; 

        wait for clk_period;
        btn <= "001";
        wait for clk_period;
        btn <= "000";  
        
        en <= '0';
        wait for 2*clk_period;

        wait;
    end process;

end Behavioral;
