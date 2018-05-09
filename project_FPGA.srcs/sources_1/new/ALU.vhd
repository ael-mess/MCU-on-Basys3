----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.04.2018 12:19:23
-- Design Name: 
-- Module Name: ALU - Behavioral
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

entity ALU is
    Port ( IR : in STD_LOGIC_VECTOR (3 downto 0);
           ARG : in STD_LOGIC_VECTOR (11 downto 0);
           RESU : out STD_LOGIC_VECTOR (11 downto 0));
end ALU;

architecture Behavioral of ALU is

signal ACC : STD_LOGIC_VECTOR (11 downto 0) := "000000000000";
signal C : STD_LOGIC_VECTOR (11 downto 0) := "000000000001";

signal tmp_sw : STD_LOGIC_VECTOR (10 downto 0);

begin

    RESU <= ACC;

    process(IR)
    begin
        case IR is
            when "0000" =>
            when "0001" =>
                ACC <= ARG and ACC;
            when "0010" =>
                ACC <= ARG xor ACC;
            when "0011" =>
                ACC <= ARG or ACC;
            when "0100" =>
                ACC <= ARG + ACC;
            when "0101" =>
                ACC <= ARG + ACC + C;
            when "0110" =>
                ACC <= ARG - ACC;
            when "0111" =>
                ACC <= ARG - ACC - C;
            when "1000" =>
                tmp_sw  <= ACC (10 downto 0);
                ACC (0) <= ACC (11);
                ACC (11 downto 1) <= tmp_sw;
            when "1001" =>
                tmp_sw  <= ACC (11 downto 1);
                ACC (11) <= ACC (0);
                ACC (10 downto 0) <= tmp_sw;
            when "1010" =>
                ACC <= ARG;
            when "1011" =>
            when "1100" =>
            when "1101" =>
            when "1110" =>
            when "1111" =>
        end case;
    end process;

end Behavioral;
