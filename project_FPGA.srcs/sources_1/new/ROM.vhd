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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ROM is
    Port ( clk : in STD_LOGIC;
           data : out STD_LOGIC_VECTOR (15 downto 0);
           PC : in STD_LOGIC_VECTOR (3 downto 0));
end ROM;

architecture Behavioral of ROM is

type tab is array(6 downto 0) of std_logic_vector(15 downto 0);
signal data_tab : tab;

signal indice : integer := 0;

begin

data_tab(1) <= "1011000000001010"; --sta
data_tab(2) <= "1011000000001010"; --sta
data_tab(3) <= "1011000000001010"; --sta
data_tab(4) <= "1011000000001010"; --sta
data_tab(5) <= "1011000000001010"; --sta
data_tab(6) <= "1011000000001010"; --sta
--data_tab(2) <= "0010000000001111"; --and
--data_tab(3) <= "1000000000000000"; --sw
--data_tab(4) <= "0011000000001111"; --or
--data_tab(5) <= "0100000000001111"; --add

indice <= to_integer(unsigned(PC));

process(clk)
begin
    if (clk='1' and clk'event) then
        data <= data_tab(indice);
    end if;
end process;

end Behavioral;
