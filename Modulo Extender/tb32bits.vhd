--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:30:08 08/25/2020
-- Design Name:   
-- Module Name:   C:/PROJECTS/XILINX/practica1/extender/tb32bits.vhd
-- Project Name:  extender
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: extender
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb32bits IS
END tb32bits;
 
ARCHITECTURE behavior OF tb32bits IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT extender
    PORT(
         Dint : IN  std_logic_vector(15 downto 0);
         Dout : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Dint : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal Dout : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
  -- constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: extender PORT MAP (
          Dint => Dint,
          Dout => Dout
        );

   -- Clock process definitions
 
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 20 ns.
      wait for 20 ns;	
		Dint<= "1111111100000000";
		wait for 20 ns;	
		Dint<= "0111111100000000";
		wait for 20 ns;	
		Dint<= "0111111111111111";
		wait for 20 ns;	
		Dint<= "1000000000000000";

   
   end process;

END;
