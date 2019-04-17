library ieee;
use ieee.std_logic_1164.all;

entity start_stop is
    port(
        a_i : in std_logic;
        b_i : in std_logic;
        c_i : in std_logic;
        y_o : out std_logic
    );
end start_stop;

architecture Behavioral of start_stop is
begin
    with c_i select
        y_o <= a_i when '0',
               b_i when others;
end Behavioral;