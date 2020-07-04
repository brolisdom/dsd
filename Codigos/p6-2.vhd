-- contador hexadecimal

library ieee;
use ieee.std_logic_1164.all;

entity pract6_2 is port (
    display: out std_logic_vector(6 downto 0);
    clk, clr, en:in std_logic
); end entity;

architecture apract6_2 of pract6_2 is --(0123456789AbCdEF)
constant edo0 : std_logic_vector( 6 downto 0) := "0000001";-- 1
constant edo1 : std_logic_vector( 6 downto 0) := "1001111";-- 4F
constant edo2 : std_logic_vector( 6 downto 0) := "0010010";-- 12
constant edo3 : std_logic_vector( 6 downto 0) := "0000110";-- 6
constant edo4 : std_logic_vector( 6 downto 0) := "1001100";-- 4C
constant edo5 : std_logic_vector( 6 downto 0) := "0100100";-- 24
constant edo6 : std_logic_vector( 6 downto 0) := "0100000";-- 20
constant edo7 : std_logic_vector( 6 downto 0) := "0001111";-- F
constant edo8 : std_logic_vector( 6 downto 0) := "0000000";-- 0
constant edo9 : std_logic_vector( 6 downto 0) := "0000100";-- 4
constant edo10 : std_logic_vector( 6 downto 0) := "0001000";-- 8
constant edo11 : std_logic_vector( 6 downto 0) := "1100000";-- 60
constant edo12 : std_logic_vector( 6 downto 0) := "0110001";-- 31
constant edo13 : std_logic_vector( 6 downto 0) := "1000010";-- 42
constant edo14 : std_logic_vector( 6 downto 0) := "0110000";-- 30
constant edo15 : std_logic_vector( 6 downto 0) := "0111000";-- 38
signal edo : std_logic_vector(6 downto 0);
begin
    process(clk, clr) begin
        if (clr = '1') then edo <= edo0;
        elsif (rising_edge(clk)) then
            if (en = '1') then
                case edo is
                    -- conteo ascendente
                    when edo0 => edo <= edo1;
                    when edo1 => edo <= edo2;
                    when edo2 => edo <= edo3;
                    when edo3 => edo <= edo4;
                    when edo4 => edo <= edo5;
                    when edo5 => edo <= edo6;
                    when edo6 => edo <= edo7;
                    when edo7 => edo <= edo8;
                    when edo8 => edo <= edo9;
                    when edo9 => edo <= edo10;
                    when edo10 => edo <= edo11;
                    when edo11 => edo <= edo12;
                    when edo12 => edo <= edo13;
                    when edo13 => edo <= edo14;
                    when edo14 => edo <= edo15;
                    when others => edo <= edo0;
                end case;
            -- retencion
            else edo <= edo;
            end if;
        end if;
    end process;
    display <= edo(6 downto 0);
end architecture;