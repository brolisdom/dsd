-- sensores 2

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity multi is port (
    clk, clr:in std_logic;
    dec: in std_logic_vector(2 downto 0);
    uni: in std_logic_vector(3 downto 0);
    anodo : out std_logic_vector (2 downto 0);
    display: out std_logic_vector(6 downto 0)
); end entity;

architecture amulti of multi is
signal anodos: std_logic_vector(2 downto 0);
signal entrada: std_logic_vector(3 downto 0);
begin
    -- contador anillo
    process(clk,clr) begin
        if(clr = '1') then anodos <= "011";
        elsif rising_edge(clk) then
            anodos <= to_stdlogicvector(to_bitvector(anodos) rol 2);
        end if;
    end process;
    anodo <= anodos;
    entrada <= '0'&dec when anodos = "101" else
    uni when anodos = "110" else "0000";
    display <= "0000001" when entrada = "0000" 
    else "1001111" when entrada = "0001" 
    else "0010010" when entrada = "0010" 
    else "0000110" when entrada = "0011" 
    else "1001100" when entrada = "0100" 
    else "0100100" when entrada = "0101" 
    else "0100000" when entrada = "0110" 
    else "0001111" when entrada = "0111" 
    else "0000000" when entrada = "1000" 
    else "0001100";
end architecture;