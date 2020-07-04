-- registros

library ieee;
use ieee.std_logic_1164.all;

entity pract2 is port (
	d : in std_logic_vector (6 downto 0);
	es, clk, clr : in std_logic;
	oper : in std_logic_vector(1 downto 0);
	q : inout std_logic_vector(6 downto 0)
); end entity;

architecture apract2 of pract2 is
signal mux : std_logic_vector(6 downto 0);
begin
--ciclos : for i in 1 to 5 generate
--	mux(i) <= q(i) when oper = "00" else
--	    d(i) when oper = "01" else
--	    q(i-1) when oper = "10" else
--	    q(i+1);
--	end generate;
-- 	mux(0) <= q(0) when oper = "00" else
--	    d(0) when oper = "01" else
--		q(es) when oper = "10" else
--		q(1);
--	mux(6) <= q(6) when oper = "00" else
--	    d(6) when oper = "01" else
--		q(5) when oper = "10" else
--		q(es);
    process (clk, clr) begin
        if (clr = '1') then q <= (others => '0');
        elsif (clk'event and clk = '1') then
            case oper is 
                when "00" => q <= q; -- retencion
                when "01" => q <= d; -- carga
                when "10" => -- c.izquiera
                    for i in 1 to 6 loop	
                        q(i) <= q(i-1);
                    end loop;
                q(0) <= es;
                when  others => -- c.derecha
                    for i in 0 to 5 loop	
                        q(i) <= q(i+1);
                    end loop;
                q(6) <= es;
            end case;
        end if;
    end process;
end architecture;