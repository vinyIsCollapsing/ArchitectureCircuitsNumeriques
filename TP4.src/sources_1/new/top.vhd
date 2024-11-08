----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.11.2024 18:05:27
-- Design Name: 
-- Module Name: top - Behavioral
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

entity top is
    port (
        mclk : in std_logic;
        btn  : in std_logic_vector(3 downto 0);
        an   : out std_logic_vector(0 to 3);
        a_to_g : out std_logic_vector(0 to 6)
    );
end top;

architecture Behavioral of top is
    signal clk190 : std_logic;
    signal count_out : std_logic_vector(1 downto 0);
    signal mux_out : std_logic_vector(3 downto 0);
    signal E1, E2, E3, E4 : std_logic_vector(3 downto 0);
begin
    clkdiv_inst : entity work.clkdiv
        port map (
            clk => mclk,
            rst => btn(3),
            clk190 => clk190
        );

    compteur_inst : entity work.compteur
        port map (
            rst => btn(3),
            clk => clk190,
            sortie => count_out
        );
        
    gestionAn_inst : entity work.gestion_an
        port map (
            sortie => count_out,
            rst => btn(3),
            an => an
        );
        
    mux4x4_inst : entity work.mux4x4
        port map (
            E1 => E1,
            E2 => E2,
            E3 => E3,
            E4 => E4,
            sortie => count_out,
            data_out => mux_out
        );

    hex7seg_inst : entity work.hex7seg
        Port map (
            hex => mux_out,
            a_to_g => a_to_g
        );
        
    E1 <= "0001";
    E2 <= "0010";
    E3 <= "0011";
    E4 <= "0100";
    
end Behavioral;
