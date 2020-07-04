-- roms 1

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity pract10_1 is port(
    clk, clr: in std_logic;
    A: in std_logic_vector(2 downto 0);
    disp: out std_logic_vector(6 downto 0)
); end entity;

architecture apract10_1 of pract10_1 is
signal AN: std_logic_vector(2 downto 0);
type ROM is array (0 to 7) of std_logic_vector(6 downto 0);
constant d : std_logic_vector(6 downto 0) := "0111101";
constant i : std_logic_vector(6 downto 0) := "0010000";
constant s : std_logic_vector(6 downto 0) := "1011011";
constant e : std_logic_vector(6 downto 0) := "1001111";
constant n : std_logic_vector(6 downto 0) := "1010101";
constant o : std_logic_vector(6 downto 0) := "0011101";
constant def : std_logic_vector(6 downto 0) := "0000000";
constant rom0: rom := (d, i, s, e, n, o, def, def);
constant rom1: rom := (def, d, i, s, e, n, o, def);
constant rom2: rom := (def, def, d, i, s, e, n, o);
begin
    -- contador de anillo
    process(clk, clr) begin
        if(clr = '1') then an <= "110";
        elsif rising_edge(clk) then
            an <= to_stdlogicvector(to_bitvector(an) rol 1);
        end if;
    end process;
    -- multiplexor
    disp <= rom0(conv_integer(a)) when an = "110" 
    else rom1(conv_integer(a)) when an = "101" 
    else rom2(conv_integer(a)) when an = "011" 
    else "0000000";
end architecture;
