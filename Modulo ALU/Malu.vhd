library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL; 

entity Malu is
    Port ( a : in  STD_LOGIC_VECTOR(31 downto 0);
           b : in  STD_LOGIC_VECTOR(31 downto 0);
           cntrl : in  STD_LOGIC_VECTOR(2 downto 0);
           zero : out  STD_LOGIC;
           result : inout  STD_LOGIC_VECTOR(31 downto 0));
end Malu;

architecture Behavioral of Malu is
signal sub, compare: STD_LOGIC_VECTOR(31 downto 0);
	
begin
   
	with cntrl select
		result <= 	(a and b) when "000",
						(a or b) when "001",
						(a + b) when "010",
						(a) when "011",
						(b(15 downto 0) & x"0000") when "100",
						(a - b) when "110",
						compare when "111",
						x"ffffffff" when others; 
						
	compare <= x"00000001" when (a < b) else x"00000000";
	zero <= '1' when (result = x"00000000") else '0';
	
	
end Behavioral;
