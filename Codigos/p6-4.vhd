-- numero boleta

library ieee;
use ieee.std_logic_1164.all;

entity pract6_4 is port (
 display: out std_logic_vector(6 downto 0);
 clk, clr, en:in std_logic
); end entity;

architecture apract6_4 of pract6_4 is -- (2015170269)
constant b0 : std_logic_vector( 6 downto 0) := "0000001"; -- 1
constant b1 : std_logic_vector( 6 downto 0) := "1001111"; -- 4F
constant b2 : std_logic_vector( 6 downto 0) := "1101101"; -- 6D
constant b5 : std_logic_vector( 6 downto 0) := "0100100"; -- 24
constant b6 : std_logic_vector( 6 downto 0) := "0100000"; -- 20
constant b7 : std_logic_vector( 6 downto 0) := "0001110"; -- E
constant b9 : std_logic_vector( 6 downto 0) := "0000100"; -- 4
constant e0 : std_logic :='0';
constant e1 : std_logic :='1';
constant edo0 : std_logic_vector( 7 downto 0) := e0 & b2; 
constant edo1 : std_logic_vector( 7 downto 0) := e0 & b0; 
constant edo2 : std_logic_vector( 7 downto 0) := e0 & b1; 
constant edo3 : std_logic_vector( 7 downto 0) := e0 & b5; 
constant edo4 : std_logic_vector( 7 downto 0) := e1 & b1; 
constant edo5 : std_logic_vector( 7 downto 0) := e0 & b7; 
constant edo6 : std_logic_vector( 7 downto 0) := e1 & b0; 
constant edo7 : std_logic_vector( 7 downto 0) := e1 & b2; 
constant edo8 : std_logic_vector( 7 downto 0) := e0 & b6; 
constant edo9 : std_logic_vector( 7 downto 0) := e0 & b9; 
signal edo : std_logic_vector(7 downto 0);
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
               when others => edo <= edo0;
            end case;
         -- retencion
         else edo <= edo;
         end if;
      end if;
   end process;
   display <= edo(6 downto 0);
end architecture;