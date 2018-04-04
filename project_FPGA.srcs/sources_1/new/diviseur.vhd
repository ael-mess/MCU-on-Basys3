----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.02.2018 14:50:57
-- Design Name: 
-- Module Name: diviseur - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity diviseur is
    Port ( clock : in STD_LOGIC;
           pulse : out STD_LOGIC;
           pulse200 :out STD_LOGIC);
end diviseur;

architecture Behavioral of diviseur is

    signal compteur : STD_LOGIC_VECTOR(25 DOWNTO 0):="00000000000000000000000000";
    signal compteur200 : STD_LOGIC_VECTOR(25 DOWNTO 0):="00000000000000000000000000";
	signal temp, temp200 : STD_LOGIC := '0';
    begin
        process(clock)
        begin
            if (clock='1' and clock'event) then
                compteur<=compteur+1;
                compteur200<=compteur200+1;
                if  compteur = "10111110101111000010000000" then --50MHZ then
                    temp <= not temp;
                    compteur <= "00000000000000000000000000";
                 end if;
                 if  compteur200 = "00000000111101000010010000" then --200HZ then
                    temp200 <= not temp200;
                    compteur200 <= "00000000000000000000000000";
                 end if;
            end if;
        end process;
	pulse <= temp;
	pulse200 <= temp200;

end Behavioral;
