-- teclado matricial

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity pract8 is port (
    fil: in std_logic_vector(3 downto 0);
    col: inout std_logic_vector(2 downto 0);
    display: out std_logic_vector(6 downto 0);
    clk, clr: in std_logic
); end pract8;

architecture apract8 of pract8 is
signal l : std_logic;
signal edo : std_logic_vector(6 downto 0);
begin 
    -- registro
    process(clk, clr) begin
        if clr = '1' then display <= "0000001";
        elsif rising_edge(clk) then
            if(l = '1') then display <= edo;
            else display <= display;
            end if;
        end if;
    end process;
    l <= not(fil(3) and fil(2) and fil(1) and fil(0));
    -- contador anillo
    process(clk, clr) begin 
        if(clr = '1') then col <= "011";
        elsif rising_edge(clk) then
            col <= to_stdlogicvector(to_bitvector(col)rol 2);
        end if;
    end process;
    -- decodificador (123456789A0g)
    edo <="1001111" when (fil & col = "0111011") -- 4F
    else "0010010" when (fil & col = "0111101") -- 12
    else "0000110" when (fil & col = "0111110") -- 6
    else "1001100" when (fil & col = "1011011") -- 4C
    else "0100100" when (fil & col = "1011101") -- 24
    else "0100000" when (fil & col = "1011110") -- 20
    else "0001111" when (fil & col = "1101011") -- F
    else "0000000" when (fil & col = "1101101") -- 0
    else "0001100" when (fil & col = "1101110") -- C
    else "0001000" when (fil & col = "1110011") -- 8
    else "0000001" when (fil & col = "1110101") -- 1
    else "0000100" when (fil & col = "1110110") --04
    else "0000001";
end architecture;