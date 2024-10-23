----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.10.2024 08:38:52
-- Design Name: 
-- Module Name: digicode_control - Behavioral
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

entity digicode_control is
    port(   rst, clk : in std_logic;
            bn : in std_logic_vector(1 downto 0);
            sw : in std_logic_vector(7 downto 0);
            pass, fail : out std_logic
    );
end digicode_control;

architecture Behavioral of digicode_control is
    type FSM_State is (INIT, S1, S2, S3, S4, er1, er2, er3, er4);
    signal State, NextState : FSM_State; -- 2 signals: current and next state
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
    next_state_logic: process(State, bn, sw)
    begin
        case State is
            when INIT =>
                if(bn = sw(7 downto 6)) then
                    NextState <= S1;
                else 
                    NextState <= er1;
                end if;
            when S1 =>
                if(bn = sw(5 downto 4)) then
                    NextState <= S2;
                else
                    NextState <= er2;
                end if;    
            when S2 =>
                if(bn = sw(3 downto 2)) then
                    NextState <= S3;
                else
                    NextState <= er3;
                end if;
            when S3 =>
                if(bn = sw(1 downto 0)) then
                    NextState <= S4;
                else
                    NextState <= er4;
                end if;
            when S4 =>
                if(bn = sw(1 downto 0)) then
                    NextState <= S1;
                else
                    NextState <= er1;
                end if;
            when er1 =>
                NextState <= er2;
            when er2 =>
                NextState <= er3;
            when er3 =>
                NextState <= er4;
            when er4 =>
                if(bn = sw(7 downto 6)) then
                    NextState <= S1;
                else
                    NextState <= er1;
                end if;
        end case;
    end process;
    
    -- Output Logic
    output_logic: process(State)
    begin
        case State is
            when INIT =>
                pass <= '0';
                fail <= '0';
            when S4 =>
                pass <= '1';
                fail <= '0';
            when er4 =>
                pass <= '0';
                fail <= '1';
            when others =>
                pass <= '0';
                fail <= '0';
        end case;
    end process;

end Behavioral;
