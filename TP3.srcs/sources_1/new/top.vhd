
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top is
    port(
        mclk : in std_logic;
        btn : in std_logic_vector (3 downto 0);     -- btn(3) -> rst
        sw : in std_logic_vector(7 downto 0);
        led : out std_logic_vector(1 downto 0) 
    );
end top;

architecture Behavioral of top is
    signal clk190ToClk, sortieToClk, passToLed1, failToLed0 : std_logic;
    signal btn012ToEntree : std_logic;         -- OR dos botões de entrada
    signal btn1ToBn0Btn2ToBn1 : std_logic_vector(1 downto 0);
    
    component clkdiv
        port (  rst : in std_logic;
                mclk : in std_logic;        -- Clock de 100Mhz
                clk190 : out std_logic      -- Clock de 190Hz
         );
    end component;
    
    component clock_pulse
        port ( clk : in std_logic;      
               rst : in std_logic;        
               entree : in std_logic;     
               sortie : out std_logic     
             );
    end component;
    
    component digicode_control
    port(   rst, clk : in std_logic;
            bn : in std_logic_vector(0 to 1);
            sw : in std_logic_vector(7 downto 0);
            pass, fail : out std_logic
    );
    end component;

begin
    u_clkdiv: clkdiv port map(
        mclk => mclk,
        rst => btn(3),
        clk190 => clk190ToClk
    );
    
    u_clock_pulse: clock_pulse port map(
        clk => clk190ToClk,
        rst => btn(3),
        entree => btn012ToEntree,
        sortie => sortieToClk
    );
    
    u_digicode_control: digicode_control port map(
        clk => sortieToClk,
        rst => btn(3),
        bn => btn1ToBn0Btn2ToBn1,
        sw => sw,
        pass => passToLed1,
        fail => failToLed0
    );
    
    btn012ToEntree <= btn(0) OR btn(1) OR btn(2);

    btn1ToBn0Btn2ToBn1(0) <= btn(1);
    btn1ToBn0Btn2ToBn1(1) <= btn(2); 

    led(1) <= passToLed1;
    led(0) <= failToLed0;

end Behavioral;
