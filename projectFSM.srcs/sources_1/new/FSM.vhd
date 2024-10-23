----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.09.2024 16:31:33
-- Design Name: 
-- Module Name: FSM - Behavioral
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
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FSM is
    port (
        rst, clk : in std_logic; -- Do not forget reset and clock!
        tempo: in std_logic_vector(7 downto 0);
        V, O, R : out std_logic);
end FSM;

architecture Behavioral of FSM is
    type FSM_State is (INIT, S1, S2, S3);
    signal State, NextState : FSM_State; -- 2 signals: current and next state

    component CompteurModule
        port (
            clk : in std_logic;
            rst : in std_logic; -- Consider if asynchronous reset is needed
            count : out std_logic_vector(7 downto 0)
        );
    end component;

begin
    
    -- Register Process
    register_process: process(rst, clk)
    begin
        if rst = '1' then
            State <= INIT;
        elsif rising_edge(clk) then
            State <= NextState;
        end if;
    end process;
    
    -- Next State Logic
    next_state_logic: process(State, tempo)
    begin
        case State is
            when INIT =>
                NextState <= S1;
            when S1 =>
                if tempo = x"80" then
                    NextState <= S2;
                else
                    NextState <= S1;
                end if;
            when S2 =>
                if tempo = x"90" then
                    NextState <= S3;
                else
                    NextState <= S2;
                end if;
            when S3 =>
                if tempo = x"00" then
                    NextState <= S1;
                else
                    NextState <= S3;
                end if;
        end case;
    end process;
    -- Output Logic
    output_logic: process(State)
    begin
        case State is
            when INIT =>
                R <= '0'; O <= '0'; V <= '0';
            when S1 =>
                R <= '0'; O <= '0'; V <= '1';
            when S2 =>
                R <= '0'; O <= '1'; V <= '0';
            when S3 =>
                R <= '1'; O <= '0'; V <= '0';
        end case;
    end process;
    --inst: CompteurModule port map(clk => clk, rst => rst, count => tempo);
end Behavioral;
