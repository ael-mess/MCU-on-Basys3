----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.02.2018 15:42:14
-- Design Name: 
-- Module Name: afficheur - Behavioral
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

entity afficheur is
    Port ( clockaff : in STD_LOGIC;
           reset : in STD_LOGIC;
           iData : in STD_LOGIC_VECTOR (19 downto 0);
           oData : out STD_LOGIC_VECTOR (7 downto 0);
           oSelect : out STD_LOGIC_VECTOR (3 downto 0));
end afficheur;

architecture Behavioral of afficheur is
    signal digit1, digit2, digit3, digit4, tselect, temp : STD_LOGIC_VECTOR (3 downto 0);
    signal point1, point2, point3, point4, ptemp : STD_LOGIC;
   
    begin
    
    digit1 <= iData (3 downto 0);
    digit2 <= iData (7 downto 4);
    digit3 <= iData (11 downto 8);
    digit4 <= iData (15 downto 12);
    point1 <= iData(16);
    point2 <= iData(17);
    point3 <= iData(18);
    point4 <= iData(19);
    oSelect <= tselect;
    oData(7) <= not ptemp;
    
    process(clockaff)
    begin 
        if reset='1' then
            tselect <= "0001";
        end if;
        if (clockaff='1' and clockaff'event) then
        
            case temp is
                    when "0000" => --0
                        oData (6 downto 0) <= "1000000";
                    when "0001" => --1
                        oData (6 downto 0) <= "1111001";
                    when "0010" => --2
                        oData (6 downto 0) <= "0100100";
                    when "0011" => --3
                        oData (6 downto 0) <= "0110000";
                    when "0100" => --4
                        oData (6 downto 0) <= "0011001";
                    when "0101" => --5
                        oData (6 downto 0) <= "0010010";
                    when "0110" => --6
                        oData (6 downto 0) <= "0000010";
                    when "0111" => --7
                        oData (6 downto 0) <= "1111000";
                    when "1000" => --8
                        oData (6 downto 0) <= "0000000";
                    when "1001" => --9
                        oData (6 downto 0) <= "0010000";
                    when "1010" => --a
                        oData (6 downto 0) <= "0001000";
                    when "1011" => --b
                        oData (6 downto 0) <= "0000011";
                    when "1100" => --c
                        oData (6 downto 0) <= "1000110";
                    when "1101" => --d
                        oData (6 downto 0) <= "0100001";
                    when "1110" => --e
                        oData (6 downto 0) <= "0000110";
                    when "1111" => --f
                        oData (6 downto 0) <= "0001110";
            end case;
        
            case tselect is
                when "1110" =>
                    temp <= digit1;
                    tselect <= "1101";
                    ptemp <= point1;
                when "1101" =>
                    temp <= digit2;
                    tselect <= "1011";
                    ptemp <= point2;
                when "1011" =>
                     temp <= digit3;
                     tselect <= "0111";
                     ptemp <= point3;
                when "0111" =>
                     temp <= digit4;
                     tselect <= "1110";
                     ptemp <= point4;
                when others =>
                     tselect <= "1110";
                end case;
        end if;
    end process;

end Behavioral;
