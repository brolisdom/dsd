-- flip/flops

library ieee;
use ieee.std_logic_1164.all;

entity pract1 is port (
	sel : in std_logic_vector(1 downto 0);
	clk,clr,d,t,s,r,j,k : in std_logic;
	disp: out std_logic_vector(5 downto 0)
); end entity;

architecture apract1 of pract1 is
signal qd,qt,qsr,qjk,mux : std_logic;
begin
--flip flop D
	process(clk,clr) begin
		if(clr = '0') then qd <= '0';
		elsif(rising_edge (clk)) then qd <= d;
		end if;
	end process;
--flip flop T
	process(clk,clr) begin
		if(clr = '0') then qt <= '0';
		elsif(rising_edge (clk)) then qt <= t xor qt;
		end if;
	end process;
--flip flop SR
	process(clk,clr) begin
		if(clr = '0') then qsr <= '0';
		elsif(rising_edge (clk)) then qsr <= s or (qsr and not r);
		end if;
	end process;
--flip flop JK
	process(clk,clr) begin
		if(clr = '0') then qjk <= '0';
		elsif(rising_edge (clk)) then qjk <= (j and not qjk) or (qjk and not k);
		end if;
	end process;
--multiplexor
	process(qd,qt,qsr,qjk)begin
	case sel is
		when "00" => mux <= qd;
		when "01" => mux <= qt;
		when "10" => mux <= qsr;
		when "11" => mux <= qjk;
		when others => mux <= '0';
	end case;
	end process;
--decodificador
	process(mux) begin
	case mux is
		when '0' => disp <= "000000";
		when '1' => disp <= "100111";
		when others => disp <= "011000";
	end case;
	end process;
end architecture;