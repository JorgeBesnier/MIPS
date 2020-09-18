library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;



entity M1add is
	Port ( a : in  STD_LOGIC_VECTOR(31 downto 0);
           b : in  STD_LOGIC_VECTOR(31 downto 0);
           c : out  STD_LOGIC_Vector(31 downto 0));
end M1add;

architecture Behavioral of M1add is

begin

	c <= a + b;
	
end Behavioral;

