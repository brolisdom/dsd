-- sensores 1

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity pract9_1 is port (
    clk, clr: in std_logic;
    s : in std_logic_vector (1 downto 0);
    u : out std_logic_vector(3 downto 0);
    d : out std_logic_vector(2 downto 0)
); end entity;

architecture apract9_1 of pract9_1 is
type estado is (q0, q1, q2, q3, q4, q5, q6, q7);
signal salida : std_logic_vector(1 downto 0);
signal ea, es : estado;
begin
    process(clk,clr) begin
        if(clr = '1') then ea <= q0;
        elsif rising_edge(clk) then ea <= es;
        end if;
    end process;
    process (ea, s) begin
        case ea is
        when q0 => if (s = "00") then salida <= "00"; es <= q0;
            elsif (s = "01") then salida <= "00"; es <= q4;
            elsif (s = "10") then salida <= "00"; es <= q1;
            else salida <= "00"; es <= q7;
            end if;
        when q1 => if (s = "00") then salida <= "00"; es <= q0;
            elsif (s = "01") then salida <= "00"; es <= q4;
            elsif (s = "10") then salida <= "00"; es <= q1;
            else salida <= "00"; es <= q2;
            end if;
        when q2 => if (s = "00") then salida <= "00"; es <= q0;
            elsif (s = "01") then salida <= "00"; es <= q3;
            elsif (s = "10") then salida <= "00"; es <= q1;
            else salida <= "00"; es <= q2; 
            end if;
        when q3 => if (s = "00") then salida <= "01"; es <= q0;
            elsif (s = "01") then salida <= "00"; es <= q3;
            elsif (s = "10") then salida <= "01"; es <= q1;
            else salida <= "00"; es <= q2;
            end if;
        when q4 => if (s = "00") then salida <= "00"; es <= q0;
            elsif (s = "01") then salida <= "00"; es <= q4;
            elsif (s = "10") then salida <= "00"; es <= q1;
            else salida <= "00"; es <= q5;
            end if;
        when q5 => if (s = "00") then salida <= "00"; es <= q0;
            elsif (s = "01") then salida <= "00"; es <= q4;
            elsif (s = "10") then salida <= "00"; es <= q6;
            else salida <= "00"; es <= q5;
            end if;
        when q6 => if (s = "00") then salida <= "10"; es <= q0;
            elsif (s = "01") then salida <= "10"; es <= q4;
            elsif (s = "10") then salida <= "00"; es <= q6;
            else salida <= "00"; es <= q5;
            end if;
        when q7 => if (s = "00") then salida <= "00"; es <= q0;
            elsif (s = "01") then salida <= "00"; es <= q4;
            elsif (s = "10") then salida <= "00"; es <= q1;
            else salida <= "00"; es <= q7;
            end if;
        end case;
    end process;
    process (clk, clr) begin  
        if (clr = '1') then  u <= "0000"; d <= "000";
        elsif rising_edge(clk) then 
            case salida is 
                when "00" =>  u <= u; d <= d;
                when "01" => 
                    if (u = "1001") then u <= "0000"; d <= d+1; 
                    else u <= u+1;
                    end if;
                when "10" => 
                    if (u = "0000") then u <= "1001"; d <= d-1;
                    else u <= u-1;
                    end if;
                when others => u <="----"; d <="---";
            end case;
        end if;
    end process;
end architecture;