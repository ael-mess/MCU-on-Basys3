----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.03.2018 09:46:44
-- Design Name: 
-- Module Name: FSM - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FSM is
    Port ( inst : out STD_LOGIC_VECTOR (3 downto 0);
           arg : out STD_LOGIC_VECTOR (11 downto 0);
           data : in STD_LOGIC_VECTOR (15 downto 0);
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           led : out STD_LOGIC_VECTOR (2 downto 0);
           PC_o : out STD_LOGIC_VECTOR (3 downto 0));
end FSM;

architecture Behavioral of FSM is

type etat is (se, sf, sd);
signal courant, suivant: etat;

signal IR : STD_LOGIC_VECTOR (15 downto 0) := "0000000000000000";
signal PC : STD_LOGIC_VECTOR (3 downto 0) := "0000";
--signal Z : STD_LOGIC;

begin

    PC_o <= PC;
    process(clk)
	begin
		if clk='1' and clk'event then 
			courant <= suivant;
		end if;
    end process;

    --process(reset)
    --begin
    --    if reset = '1' then
    --        PC <= "0000"; --(others => '0');
    --   end if;
    --end process;

    process(courant)
    begin
            case courant is
               when sf =>
                   PC <= PC + "0001";
                   IR <= data;
                   suivant <= sd;
                   led <= "001";    
               when sd =>
                   inst <= IR (15 downto 12);
                   suivant <= se;
                   led <= "010"; 
               when se =>
                   arg <= IR (11 downto 0);
                   suivant <= sf;
                   led <= "100"; 
            end case;
    end process;

end Behavioral;
