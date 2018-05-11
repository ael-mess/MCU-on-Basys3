----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.04.2018 09:25:20
-- Design Name: 
-- Module Name: test_up - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity test_up is
    Port ( clock : in STD_LOGIC;
           reset : in STD_LOGIC;
           led : out STD_LOGIC_VECTOR (2 downto 0);
           oSelect : out STD_LOGIC_VECTOR (3 downto 0);
           oData : out STD_LOGIC_VECTOR (7 downto 0));
end test_up;

architecture Behavioral of test_up is

signal clk_up : STD_LOGIC;
signal clk_aff : STD_LOGIC;
signal data_out : STD_LOGIC_VECTOR (19 downto 0) := "00000000000000000000";

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
component up
    Port ( clk_up : in STD_LOGIC;
           reset : in STD_LOGIC;
           led : out STD_LOGIC_VECTOR (2 downto 0);
           resu : out STD_LOGIC_VECTOR (11 downto 0));
end component;

begin

div : diviseur port map (clock => clock, pulse => clk_up, pulse200 => clk_aff);
microp : up port map (clk_up => clk_up, reset => reset, led => led, resu => data_out (11 downto 0));
aff : afficheur port map (clockaff => clk_aff, iData => data_out, reset => reset, oData => oData, oSelect => oSelect);

end Behavioral;
