----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.03.2018 11:42:08
-- Design Name: 
-- Module Name: ROM - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ROM is
    generic ( SIZE : positive := 15);
    Port ( clk : in STD_LOGIC;
           data : out STD_LOGIC_VECTOR (15 downto 0);
           PC : in STD_LOGIC_VECTOR (3 downto 0));
end ROM;

architecture Behavioral of ROM is

type tab is array(SIZE downto 0) of std_logic_vector(15 downto 0);
signal data_tab : tab;

--signal ind : integer := 0;
signal p_pc : integer := 0;
signal c : STD_LOGIC_VECTOR (1 downto 0) := "00";
signal test : STD_LOGIC_VECTOR (15 downto 0) := "1010000000000000";

begin

data_tab(0) <= "1010000000001010"; --sta 0xA
data_tab(1) <= "1010000000001011"; --sta 0xB
data_tab(2) <= "1010000000001100"; --sta 0xC
data_tab(3) <= "1010000000001101"; --sta 0xD
data_tab(4) <= "1010000000001110"; --sta 0xE
data_tab(5) <= "1010000000001111"; --sta 0xF
data_tab(6) <= "0001000000001111"; --and 0x0
data_tab(7) <= "1000000000000000"; --sw
data_tab(8) <= "1000000000000000"; --sw
data_tab(9) <= "1000000000000000"; --sw
data_tab(10) <= "0011000010100000"; --or 0xA0
data_tab(11) <= "0100000000001111"; --add 0xF
data_tab(12) <= "1010111110110001"; --sta 0xFB1
data_tab(13) <= "1010110000011010"; --sta 0xC1A
data_tab(14) <= "1010111111111111"; --sta 0xFFF

--ind <= to_integer(unsigned(PC));

--process(PC)
--begin
--    if ind = SIZE then
--        data <= "1010111000001111"; --sta EOF
--    else
--        data <= data_tab(ind);
--    end if;
--end process;

process(clk)
begin
    --data <= data_tab(to_integer(unsigned(PC)));
    if clk='1' and clk'event then
        if c="00" then       
            data <= data_tab(p_pc);
            p_pc <= p_pc + 1;
            if p_pc>=SIZE then data <= "1010111000001111"; --sta EOF
            end if;
        end if;
        c <= c + "01";
        if c="11" then c<="00";
        end if;
    end if;
end process;

end Behavioral;
