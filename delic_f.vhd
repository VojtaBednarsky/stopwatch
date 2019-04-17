library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;    -- for +/- arithmetic operations

entity delic_f is
    port(
        clk_i   : in std_logic;
        rst_n_i : in std_logic;
        
        carry_n_o : out std_logic;
        delic_f_o : out std_logic_vector(7-1 downto 0)
    );
end delic_f;

architecture Behavioral of delic_f is
    signal s_reg  : std_logic_vector(7-1 downto 0);
    signal s_next : std_logic_vector(7-1 downto 0);
begin
    p_delic_f: process(clk_i)
    begin
        if rising_edge(clk_i) then
            if rst_n_i = '0' then           -- synchronous reset
                s_reg <= (others => '0');   -- clear all bits in register
            else
                s_reg <= s_next;            -- update register value
            end if;
        end if;
    end process p_delic_f;
    
    s_next <= "0000000" when(s_reg = "1100011")else
              s_reg + 1;
    delic_f_o <= s_reg;
    carry_n_o <= '0' when(s_reg = "1100011")else
                 '1';
                 
end Behavioral;