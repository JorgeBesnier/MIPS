----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:19:29 08/25/2020 
-- Design Name: 
-- Module Name:    moduleSL2bits - Behavioral 
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

entity moduleSL2bits is
  Port (
	       Dint: in STD_LOGIC_VECTOR (31 downto 0);
			 Dout: out STD_LOGIC_VECTOR (31 downto 0)

		
			 );

end moduleSL2bits;

architecture Behavioral of moduleSL2bits is

begin 
    
		Dout <= (Dint(29 downto 0) & "00");

end Behavioral;

