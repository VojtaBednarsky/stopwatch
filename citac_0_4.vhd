library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;    -- for +/- arithmetic operations

entity citac_0_4 is
    port(
        clk_i   : in std_logic;
        rst_n_i : in std_logic;
        
        carry_n_o   : out std_logic;
        citac_0_4_o : out std_logic_vector(4-1 downto 0)
    );
end citac_0_4;

architecture Behavioral of citac_0_4 is
    signal s_reg  : std_logic_vector(4-1 downto 0);
    signal s_next : std_logic_vector(4-1 downto 0);
begin
    p_citac_0_4: process(clk_i,rst_n_i)     --asynchroni reset
    begin
        if rst_n_i = '0' then
            s_reg <= (others => '0');
            elsif rising_edge(clk_i) then
                s_reg <= s_next;
        end if;
    end process p_citac_0_4;
    
    s_next <= "0000" when(s_reg = "0100")else
              s_reg + 1;
    citac_0_4_o <= s_reg;
    carry_n_o <= '0' when(s_reg = "0100")else
                 '1';
end Behavioral;