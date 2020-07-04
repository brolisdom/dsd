-- mi nombre

library ieee;
use ieee.std_logic_1164.all;

entity pract6_3 is port (
   display: out std_logic_vector(6 downto 0);
   clk, clr, en:in std_logic
); end entity;

architecture apract6_3 of pract6_3 is -- (SEBAStIAn)
constant s : std_logic_vector( 6 downto 0) := "0100100"; -- 24
constant e : std_logic_vector( 6 downto 0) := "0110000"; -- 30
constant b : std_logic_vector( 6 downto 0) := "0000000"; -- 0
constant a : std_logic_vector( 6 downto 0) := "0001000"; -- 8
constant t : std_logic_vector( 6 downto 0) := "1110000"; -- 70
constant i : std_logic_vector( 6 downto 0) := "1111001"; -- 79
constant n : std_logic_vector( 6 downto 0) := "1101010"; -- 6A
constant e0 : std_logic_vector(1 downto 0) :="00";
constant e1 : std_logic_vector(1 downto 0) :="01";
constant e2 : std_logic_vector(1 downto 0) :="10";
constant edo0 : std_logic_vector( 8 downto 0) := e0 & s; 
constant edo1 : std_logic_vector( 8 downto 0) := e0 & e; 
constant edo2 : std_logic_vector( 8 downto 0) := e0 & b; 
constant edo3 : std_logic_vector( 8 downto 0) := e1 & a; 
constant edo4 : std_logic_vector( 8 downto 0) := e1 & s; 
constant edo5 : std_logic_vector( 8 downto 0) := e0 & t; 
constant edo6 : std_logic_vector( 8 downto 0) := e0 & i; 
constant edo7 : std_logic_vector( 8 downto 0) := e2 & a; 
constant edo8 : std_logic_vector( 8 downto 0) := e0 & n; 
signal edo : std_logic_vector(8 downto 0);
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
               when others => edo <= edo0;
            end case;
         -- retencion
         else edo <= edo;
         end if;
      end if;
   end process;
   display <= edo(6 downto 0);
end architecture;