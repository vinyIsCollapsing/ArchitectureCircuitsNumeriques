library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity reg_saisie is
    Port (
        clk    : in  std_logic;
        rst  : in  std_logic;
        btn    : in  std_logic_vector(2 downto 0);
        en     : in  std_logic;                    -- Habilitar ou nao a entrada
        E1     : out std_logic_vector(3 downto 0); 
        E2     : out std_logic_vector(3 downto 0); 
        E3     : out std_logic_vector(3 downto 0); 
        E4     : out std_logic_vector(3 downto 0)  
    );
end reg_saisie;

architecture Behavioral of reg_saisie is
    signal internal_register : std_logic_vector(15 downto 0); -- Registrador interno para armazenamento 
    signal position : integer range 0 to 3 := 0; -- Posicao atual registrador
    signal button_value : std_logic_vector(3 downto 0);
begin

    -- Definir o valor do botão pressionado
    button_value <= "0000" when btn = "001" else 
                    "0001" when btn = "010" else 
                    "0010" when btn = "100" else 
                    "0000";                      

    -- Processo principal para armazenamento dos dígitos
    process(clk, rst)
    begin
        if rst = '1' then
            internal_register <= (others => '0');
            position <= 0;
        elsif rising_edge(clk) then
            if en = '1' then  -- Habilita a escrita apenas quando en tiver ativo
                case position is
                    when 0 => internal_register(15 downto 12) <= button_value;
                    when 1 => internal_register(11 downto 8)  <= button_value;
                    when 2 => internal_register(7 downto 4)   <= button_value;
                    when 3 => internal_register(3 downto 0)   <= button_value;
                end case;
                
                if position < 3 then
                    position <= position + 1;
                end if;
            end if;
        end if;
    end process;

    E1 <= internal_register(15 downto 12);
    E2 <= internal_register(11 downto 8);
    E3 <= internal_register(7 downto 4);
    E4 <= internal_register(3 downto 0);

end Behavioral;
