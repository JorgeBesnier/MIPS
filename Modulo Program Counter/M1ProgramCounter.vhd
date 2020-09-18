library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL; 

entity M1ProgramCounter is
    Port ( D : in  STD_LOGIC_VECTOR(31 downto 0);
           Q : out  STD_LOGIC_VECTOR (31 downto 0);
           RESET : in  STD_LOGIC;
           CLK : in  STD_LOGIC);
end M1ProgramCounter;

architecture Behavioral of M1ProgramCounter is

begin

	process(CLK, D, RESET)
	begin
		if RESET = '1' then Q <= "00000000000000000000000000000000";
			elsif CLK'event and (CLK = '1') then Q <= D;
		end if;
	end process;
	
end Behavioral;

