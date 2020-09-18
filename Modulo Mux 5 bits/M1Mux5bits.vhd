library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL; 

entity M1Mux5bits is
    Port ( a : in  STD_LOGIC_VECTOR (4 downto 0);
           b : in  STD_LOGIC_VECTOR (4 downto 0);
           sel : in  STD_LOGIC;
           outMUX : out  STD_LOGIC_VECTOR (4 downto 0));
end M1Mux5bits;

architecture Behavioral of M1Mux5bits is

begin
	
	with sel select
		outMUX <= a when '0', 
					 b when others;

end Behavioral;

