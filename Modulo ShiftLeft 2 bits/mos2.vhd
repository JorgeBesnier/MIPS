----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    03:32:24 08/25/2020 
-- Design Name: 
-- Module Name:    mos2 - Behavioral 
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


entity mos2 is
 Port (
	       Dint: in STD_LOGIC_VECTOR (25 downto 0);
			 Dout: out STD_LOGIC_VECTOR (27 downto 0)
		
			 );
end mos2;																																						

architecture Behavioral of mos2 is

begin

	  Dout <= Dint & "00";

end Behavioral;

  



