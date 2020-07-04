-- repaso

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity pract0 is port(
	a,b,ref : in std_logic_vector(2 downto 0);
	sel: in std_logic;
	dis: out std_logic_vector(6 downto 0)
); end pract0;

architecture apract0 of pract0 is 
signal aux,cod : std_logic_vector(2 downto 0);
begin
	aux <= a when sel = '1' else b;
	process(aux,ref) begin
		if(aux<ref) then cod <= "100";
		elsif(aux>ref) then cod <= "001";
		else cod <= "010";
		end if;
	end process;
	process(cod) begin
		if(cod = "100") then dis <= "1111000"; -- 78
		elsif(cod = "001") then dis <= "1001110"; -- 4E
		elsif(cod = "010") then dis <= "1001000"; -- 48
		else dis <= "-------"; 
		end if;
	end process;
end architecture;