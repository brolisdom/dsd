-- cartas asm 2

library ieee;
use ieee.std_logic_1164.all;

entity pract11 is port (
    clk, clr, lb, eb, ec : in std_logic;
    dis: out std_logic_vector (6 downto 0));
end entity;

architecture apract11 of pract11 is
type estados is (e0, e1, e2, e3, e4, e5, e6);
signal est : estados;
begin
    process (clr, clk) begin
        if(clr='1') then est <= e0;
        elsif (rising_edge(clk)) then
            if (lb = '1' and eb = '0') then est <= e0;
            elsif (lb = '0' and eb = '1') then 
                case est is
                    when e0 => est <= e1;
                    when e1 => est <= e2;
                    when e2 => est <= e3;
                    when e3 => est <= e4;
                    when e4 => est <= e5;
                    when others => est <= e6;
                end case;
            else est <= est;
            end if;
        end if;
    end process;
    process (ec, est) begin
        if(ec = '0') then dis <= "0001000";
        else 
            case est is
                when e0 => dis <= "1111110";
                when e1 => dis <= "0011000";
                when e2 => dis <= "1101101";
                when e3 => dis <= "1111001";
                when e4 => dis <= "0110011";
                when e5 => dis <= "1011011";
                when others => dis <= "1011111";
            end case;
        end if;
    end process;
end architecture;