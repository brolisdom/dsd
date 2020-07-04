-- dado digital

library ieee;
use ieee.std_logic_1164.all;

entity pract6_1 is port (
    display: out std_logic_vector(6 downto 0);
    clk, clr, en:in std_logic
); end entity;

architecture apract6_1 of pract6_1 is
constant edo0 : std_logic_vector( 6 downto 0) := "1001111"; -- 4F
constant edo1 : std_logic_vector( 6 downto 0) := "0010010"; -- 12
constant edo2 : std_logic_vector( 6 downto 0) := "0000110"; -- 6
constant edo3 : std_logic_vector( 6 downto 0) := "1001100"; -- 4C
constant edo4 : std_logic_vector( 6 downto 0) := "0100100"; -- 24
constant edo5 : std_logic_vector( 6 downto 0) := "0100000"; -- 20
signal edo : std_logic_vector(6 downto 0);
begin
    process(clk, clr) begin
        if (clr = '1') then edo <= edo0;
        elsif (rising_edge(clk)) then
            if (en = '1') then
                -- conteo automatico
                case edo is
                    when edo0 => edo <= edo1;
                    when edo1 => edo <= edo2;
                    when edo2 => edo <= edo3;
                    when edo3 => edo <= edo4;
                    when edo4 => edo <= edo5;
                    when others => edo <= edo0;
                end case;
            -- retencion aleatoria
            else edo <= edo;
            end if;
        end if;
    end process;
    display <= edo(6 downto 0);
end architecture;