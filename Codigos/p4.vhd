-- mensaje multiplexado

library ieee;
use ieee.std_logic_1164.all;

entity pract4 is port(
    clk, clr: in std_logic;
    display: out std_logic_vector(6 downto 0);
    anodo: out std_logic_vector(2 downto 0)
); end entity;

architecture apract4 of pract4 is
signal edo: std_logic_vector(2 downto 0);
begin 
    process(clk, clr) begin
        if(clr = '1') then edo <= "001";
        elsif (rising_edge(clk)) then
            -- cambio al estado al que sigue
            case edo is
                when "001" => edo <= "010";
                when "010" => edo <= "100";
                when "100" => edo <= "001";
                when others => edo <= "001";
            end case;
        end if;
    end process;
    anodo <= edo;
    --asigno valores al display (IPN)
    display <= "1100111" when (anodo = "001") -- 67
    else "0010101" when (anodo = "010") -- 15
    else "0110000"; -- 30
end architecture;