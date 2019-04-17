
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;    -- for +/- arithmetic operations

entity bin_cnt is
    generic(
        N_BIT : integer := 8
    );

    port (
        clk_i   : in std_logic;
        rst_n_i : in std_logic;     -- std_logic je 0 nebo 1
        
        bin_cnt_o : out std_logic_vector(N_BIT-1 downto 0) --std_logic_vector je více bitové číslo
    );
end bin_cnt;

architecture Behavioral of bin_cnt is
    signal s_reg  : std_logic_vector(N_BIT-1 downto 0);
    signal s_next : std_logic_vector(N_BIT-1 downto 0);
begin

    p_bin_cnt: process(clk_i)       -- KO D
    begin
        if rising_edge(clk_i) then
            if rst_n_i = '0' then
                s_reg <= (others => '0');
            else
                s_reg <= s_next;
            end if;
        end if;
    end process p_bin_cnt;
    
    s_next <= s_reg + 1;            -- scitacka
    
    bin_cnt_o <= s_reg;
end Behavioral;