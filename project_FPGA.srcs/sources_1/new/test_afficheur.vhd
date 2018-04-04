----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.02.2018 17:43:09
-- Design Name: 
-- Module Name: test_afficheur - Behavioral
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

entity test_afficheur is
    Port ( clock : in STD_LOGIC;
           iData : in STD_LOGIC_VECTOR (19 downto 0);
           reset : in STD_LOGIC;
           oData : out STD_LOGIC_VECTOR (7 downto 0);
           oSelect : out STD_LOGIC_VECTOR (3 downto 0);
           pulse : out STD_LOGIC);
end test_afficheur;

architecture Behavioral of test_afficheur is

signal clk : STD_LOGIC;
component diviseur
    Port ( clock : in STD_LOGIC;
           pulse, pulse200 :out STD_LOGIC);
end component;
component afficheur
    Port ( clockaff : in STD_LOGIC;
           reset : in STD_LOGIC;
           iData : in STD_LOGIC_VECTOR (19 downto 0);
           oData : out STD_LOGIC_VECTOR (7 downto 0);
           oSelect : out STD_LOGIC_VECTOR (3 downto 0));
end component;

begin

aff : afficheur port map ( clockaff => clk, iData => iData, reset => reset, oData => oData, oSelect => oSelect);
div : diviseur port map (clock => clock, pulse => pulse, pulse200 => clk);

end Behavioral;
