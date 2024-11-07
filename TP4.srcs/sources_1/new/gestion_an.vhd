----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.11.2024 15:56:19
-- Design Name: 
-- Module Name: gestion_an - Behavioral
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

entity gestion_an is
    port (  sortie : in std_logic_vector(1 downto 0);   -- Entree de compteur
            rst : in std_logic;
            an : out std_logic_vector(3 downto 0)
    );
end gestion_an;

architecture Behavioral of gestion_an is

begin
    process(rst, sortie)
    begin
        if rst = '1' then
            an <= "1111";  -- Reset: an ativa em zero, logo desativa em 1
        else
            case sortie is
                when "00" => an <= "1110";      -- Ativa o primeiro display (D1)
                when "01" => an <= "1101";      -- D2
                when "10" => an <= "1011";      -- D3
                when "11" => an <= "0111";      -- D4
                when others => an <= "1111";
            end case;
        end if;
    end process;
end Behavioral;
