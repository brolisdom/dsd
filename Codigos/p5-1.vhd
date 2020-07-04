-- contadores

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity pract5_1 is port (
    q: out std_logic_vector(7 downto 0);
    clk, clr, en: in std_logic
); end entity;

architecture apract5_1 of pract5_1 is
signal aux: std_logic_vector(7 downto 0);
begin 
    process(clk, clr)
    variable aux : std_logic; 
    begin
        if (clr = '1') then q <= (others => '0');
        elsif rising_edge(clk) then
            -- si en = 0 retencion
            -- si en = 1 conteo asc
            for i in 0 to 7 loop
                aux := en;
                for j in 0 to i-1 loop
                    aux := aux and q(j);
                end loop;
                q(i) <= q(i) xor aux;
            end loop;
        end if;
    end process;
end architecture;