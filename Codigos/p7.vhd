-- marquesina

library ieee;
use ieee.std_logic_1164.all;

entity pract_7 is port (
    e : in std_logic_vector (2 downto 0);
    display: out std_logic_vector(6 downto 0);
    anodo: out std_logic_vector(2 downto 0);
    clk, clr :in std_logic
); end entity;

architecture apract_7 of pract_7 is -- (POLI)
constant l1 : std_logic_vector( 6 downto 0) := "0011000"; -- 18
constant l2 : std_logic_vector( 6 downto 0) := "0000001"; -- 1
constant l3 : std_logic_vector( 6 downto 0) := "0001110"; -- E
constant l4 : std_logic_vector( 6 downto 0) := "0000110"; -- 6
constant d0 : std_logic_vector(2 downto 0) :="110"; -- 6
constant d1 : std_logic_vector(2 downto 0) :="101"; -- 5
constant d2 : std_logic_vector(2 downto 0) :="011"; -- 3
constant edo0 : std_logic_vector( 9 downto 0) := "0000000000";
constant edo1 : std_logic_vector( 9 downto 0) := d0 & l1;
constant edo2 : std_logic_vector( 9 downto 0) := d1 & l1;
constant edo3 : std_logic_vector( 9 downto 0) := d0 & l2;
constant edo4 : std_logic_vector( 9 downto 0) := d2 & l1;
constant edo5 : std_logic_vector( 9 downto 0) := d1 & l2;
constant edo6 : std_logic_vector( 9 downto 0) := d0 & l3;
constant edo7 : std_logic_vector( 9 downto 0) := d2 & l2;
constant edo8 : std_logic_vector( 9 downto 0) := d1 & l3;
constant edo9 : std_logic_vector( 9 downto 0) := d0 & l4;
constant edo10 : std_logic_vector( 9 downto 0) := d2 & l3;
constant edo11 : std_logic_vector( 9 downto 0) := d1 & l4;
constant edo12 : std_logic_vector( 9 downto 0) := d2 & l4;
signal edo : std_logic_vector(9 downto 0);
begin
    process(clk, clr) begin
        if (clr = '1') then edo <= edo0;
        elsif (rising_edge(clk)) then
            case edo is
                -- transicion de estados
                when edo0 =>
                    if (e = "000" or e = "001") then edo <= edo0;
                    elsif (e = "010") then edo <= edo1;
                    else edo <= edo0;
                    end if;
                when edo1 =>
                    if(e = "010") then edo <= edo1;
                    elsif(e = "011") then edo <= edo2;
                    else edo <= edo0;
                    end if;
                when edo2 =>
                    if(e = "100") then edo <= edo4;
                    elsif(e = "011") then edo <= edo3;
                    else edo <= edo0;
                    end if;
                when edo3 =>
                    if(e = "100") then edo <= edo4;
                    elsif(e = "011") then edo <= edo2;
                    else edo <= edo0;
                    end if;
                when edo4 =>
                    if(e = "100") then edo <= edo5;
                    elsif(e = "101") then edo <= edo7;
                    else edo <= edo0;
                    end if;
                when edo5 =>
                    if(e = "100") then edo <= edo6;
                    elsif(e = "101") then edo <= edo7;
                    else edo <= edo0;
                    end if;
                when edo6 =>
                    if(e = "101") then edo <= edo7;
                    elsif(e = "100") then edo <= edo4;
                    else edo <= edo0;
                    end if;
                when edo7 =>
                    if(e = "101") then edo <= edo8;
                    elsif(e = "110") then edo <= edo10;
                    else edo <= edo0;
                    end if;
                when edo8 =>
                    if(e = "101") then edo <= edo9;
                    elsif(e = "110") then edo <= edo10;
                    else edo <= edo0;
                    end if;
                when edo9 =>
                    if(e = "110") then edo <= edo10;
                    elsif(e = "101") then edo <= edo7;
                    else edo <= edo0;
                    end if;
                when edo10 =>
                    if(e = "110") then edo <= edo11;
                    elsif(e = "111") then edo <= edo12;
                    else edo <= edo0;
                    end if;
                when edo11 =>
                    if(e = "111") then edo <= edo12;
                    elsif(e = "110") then edo <= edo10;
                    else edo <= edo0;
                    end if;
                when edo12 =>
                    if(e = "000") then edo <= edo0;
                    elsif(e = "111") then edo <= edo12;
                    else edo <= edo0;
                    end if;
                when others => edo <= edo0;
            end case;
        end if;
    end process;
    display <= edo(6 downto 0);
    anodo <= edo (9 downto 7);
end architecture;