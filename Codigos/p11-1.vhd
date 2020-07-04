-- cartas asm 1

library ieee;
use ieee.std_logic_1164.all;

entity pract11_1 is port (
    clk, clr, ini : in std_logic;
    dato : in std_logic_vector (5 downto 0);
    a: out std_logic_vector (5 downto 0);
    lb, eb, ec : out std_logic);
end entity;

architecture apract11_1 of pract11_1 is
signal la, ea, z: std_logic;
type estados is (e0, e1, e2);
signal act, sig : estados;
begin
    process (clk, clr) begin
        if (clr = '1') then act <= e0;
        elsif (rising_edge(clk)) then act <= sig;
        end if;
    end process;
    process (act, z, a , ini) begin
        la <= '0'; lb <= '0'; ea <= '0'; eb <= '0'; ec <= '0';
        z <= a(5) or a(4) or a(3) or a(2) or a(1) or a(0);
        case act is
            when e0 => lb <= '1';
                if (ini = '1') then sig <= e1;
                else la <= '1'; sig <= e0;
                end if;
            when e1 => ea <= '1';
                if (z='1' and a(0)='1') then 
                    eb <= '1'; sig <= e1;
                elsif (z='1' and a(0)='0') then sig <= e1;
                else sig <= e2;
                end if;
            when others => ec <= '1';
                if (ini = '1') then sig <= e2;
                else sig <= e0; 
                end if;
        end case;
    end process;
    process (clk, clr) begin
        if (clr = '1') then a <= "000000";
        elsif (rising_edge(clk)) then
            if (ea = '0' and la = '1') then a <= dato;
            elsif (ea = '1' and la = '0') then
                a(4 downto 0) <= a(5 downto 1); a(5) <= '0';
            end if;
        end if;
    end process;
end architecture;
