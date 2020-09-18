----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:45:08 08/25/2020 
-- Design Name: 
-- Module Name:    extender - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
use ieee.numeric_std.all;



entity extender is
Port (
	       Dint: in STD_LOGIC_VECTOR (15 downto 0);
			 Dout: out STD_LOGIC_VECTOR (31 downto 0)
		
			 );
end extender;

architecture Behavioral of extender is

begin

process (Dint)

begin
 if (Dint(15) = '1') then
 
 Dout <= "1111111111111111" & Dint;
 else 
 Dout <= "0000000000000000" & Dint;
 end if;
 end process;


end Behavioral;

