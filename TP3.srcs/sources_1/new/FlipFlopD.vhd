----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.10.2024 17:16:07
-- Design Name: 
-- Module Name: FlipFlopD - Behavioral
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

entity FlipFlopD is
    port ( clk : in std_logic;    -- Clock
           d   : in std_logic;    -- Entrada de dados
           rst : in std_logic;    -- Reset assíncrono
           q   : out std_logic    -- Saída
         );
end FlipFlopD;

architecture Behavioral of FlipFlopD is

begin
    process(clk, rst)
    begin
        if rst = '1' then
            q <= '0';            -- Reset para 0
        elsif rising_edge(clk) then
            q <= d;              -- Captura o valor de 'd' na borda de subida do clock
        end if;
    end process;

end Behavioral;
