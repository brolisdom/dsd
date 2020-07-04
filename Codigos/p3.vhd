-- detector secuencia

library ieee;
use ieee.std_logic_1164.all;

entity pract3 is port(
    clk, clr, e: in std_logic;
	dis: out std_logic_vector(6 downto 0)
); end entity;

architecture apract3 of pract3 is 
signal q1, q0, y: std_logic;
begin
    process(clk, clr) begin
        if(clr = '1') then
            q1 <= '0';
            q0 <= '0';
        elsif rising_edge(clk) then
            q0 <= (q0 and (not q1)) or (e and q1 and (not q0));
            q1 <= (e and (q0 xnor q1)) or (q0 and (not q1) and (not e));
        end if;
    end process;
    y <= e and q0 and q1;	
    process(y) begin
        if(y = '1') then dis <= "0110000";
        else dis <= "0001000";
        end if;
    end process;
end architecture;