-- roms 2

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity pract10_2 is port(
    clk, clr: in std_logic;
    Q: in std_logic_vector(3 downto 0);
    dis: out std_logic_vector(6 downto 0)
); end entity;

architecture apract10_2 of pract10_2 is
signal AN: std_logic_vector(2 downto 0);
signal aux: std_logic_vector(3 downto 0);
type ROM is array (0 to 15) of std_logic_vector(3 downto 0);
constant dis_def : std_logic_vector(6 downto 0) := "0001000";
constant dis_d : std_logic_vector(6 downto 0) := "0111101";
constant dis_i : std_logic_vector(6 downto 0) := "0110000";
constant dis_s : std_logic_vector(6 downto 0) := "1011011";
constant dis_e : std_logic_vector(6 downto 0) := "1001111";
constant dis_n : std_logic_vector(6 downto 0) := "1010101";
constant dis_o : std_logic_vector(6 downto 0) := "0011101";
constant dis_g : std_logic_vector(6 downto 0) := "1011111";
constant dis_t : std_logic_vector(6 downto 0) := "0001111";
constant dis_a : std_logic_vector(6 downto 0) := "1110111";
constant dis_l : std_logic_vector(6 downto 0) := "0001110";
constant def : std_logic_vector(3 downto 0) := "0000";
constant d : std_logic_vector(3 downto 0) := "0001";
constant i : std_logic_vector(3 downto 0) := "0010";
constant s : std_logic_vector(3 downto 0) := "0011";
constant e : std_logic_vector(3 downto 0) := "0100";
constant n : std_logic_vector(3 downto 0) := "0101";
constant o : std_logic_vector(3 downto 0) := "0110";
constant g : std_logic_vector(3 downto 0) := "0111";
constant t : std_logic_vector(3 downto 0) := "1000";
constant a : std_logic_vector(3 downto 0) := "1001";
constant l : std_logic_vector(3 downto 0) := "1010";
constant rom0: rom := (d, i, s, e, n, o, def, d, i, g, i, t, a, l, def, def);
constant rom1: rom := (def, d, i, s, e, n, o, def, d, i, g, i, t, a, l, def);
constant rom2: rom := (def, def, d, i, s, e, n, o, def, d, i, g, i, t, a, l );
begin
    -- contador de anillo
    process(clk, clr) begin
        if(clr = '1') then an <= "110";
        elsif rising_edge(clk) then
            an <= to_stdlogicvector(to_bitvector(an) rol 1);
        end if;
    end process;
    -- multiplexor
    aux <= rom0(conv_integer(a)) when an = "110" 
    else rom1(conv_integer(a)) when an = "101" 
    else rom2(conv_integer(a)) when an = "011" 
    else "----";
    --convertidor de código
    dis <= dis_def when aux = def 
    else dis_d when aux = d 
    else dis_i when aux = i 
    else dis_s when aux = s 
    else dis_e when aux = e 
    else dis_n when aux = n 
    else dis_o when aux = o 
    else dis_g when aux = g 
    else dis_t when aux = t 
    else dis_a when aux = a 
    else dis_l when aux = l 
    else "-------";
end architecture;