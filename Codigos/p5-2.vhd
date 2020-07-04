-- contador completo

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity pract5_2 is port (
    d: in std_logic_vector(7 downto 0);
    q: out std_logic_vector(7 downto 0);
    clk, clr, en, ud, l: in std_logic
); end entity;

architecture apract5_2 of pract5_2 is
signal aux: std_logic_vector(7 downto 0);
begin
    process(clk, clr) begin
        if (clr = '1') then aux <= (others => '0');
        elsif rising_edge(clk) then
            -- operacion de retencion
            if (en = '0') then aux <= aux;
            else 
            -- operacion de carga
                if (l = '1') then aux <= d;
                else
                    if(ud = '0') then -- descendente
                        if(aux = "00000000") then aux <= "11111111";
                        else aux <= aux - 1;
                        end if;
                    else -- ascendente
                        if(aux = "11111111") then aux <= "00000000";
                        else aux <= aux + 1;
                        end if;
                    end if;
                end if;
            end if;
        end if;
    end process;
    q <= aux;
end architecture;