----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.04.2018 09:25:20
-- Design Name: 
-- Module Name: up - Behavioral
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

entity up is
    Port ( clk_up : in STD_LOGIC;
           reset : in STD_LOGIC;
           led : out STD_LOGIC_VECTOR (2 downto 0);
           resu : out STD_LOGIC_VECTOR (11 downto 0));
end up;

architecture Behavioral of up is

signal PC : STD_LOGIC_VECTOR (3 downto 0);
signal data_in : STD_LOGIC_VECTOR (15 downto 0);
signal IR : STD_LOGIC_VECTOR (3 downto 0);
signal ACC : STD_LOGIC_VECTOR (11 downto 0);

component FSM
    Port ( inst : out STD_LOGIC_VECTOR (3 downto 0);
           arg : out STD_LOGIC_VECTOR (11 downto 0);
           data : in STD_LOGIC_VECTOR (15 downto 0);
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           led : out STD_LOGIC_VECTOR (2 downto 0);
           PC_o : out STD_LOGIC_VECTOR (3 downto 0));
end component;
component ROM
    Port ( data : out STD_LOGIC_VECTOR (15 downto 0);
           PC : in STD_LOGIC_VECTOR (3 downto 0));
end component;
component ALU
    Port ( IR : in STD_LOGIC_VECTOR (3 downto 0);
           ARG : in STD_LOGIC_VECTOR (11 downto 0);
           RESU : out STD_LOGIC_VECTOR (11 downto 0));
end component;

begin

mem : ROM port map (data => data_in, PC => PC);
mef : FSM port map (inst => IR, arg => ACC, data => data_in, clk => clk_up, reset => reset, PC_o => PC, led => led);
ual : ALU port map (IR => IR, ARG => ACC, RESU => resu);

end Behavioral;
