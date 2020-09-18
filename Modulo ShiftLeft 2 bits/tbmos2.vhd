--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:55:21 08/25/2020
-- Design Name:   
-- Module Name:   C:/PROJECTS/XILINX/practica1/modu2/tbmos2.vhd
-- Project Name:  modu2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mos2
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
 
ENTITY tbmos2 IS
END tbmos2;
 
ARCHITECTURE behavior OF tbmos2 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mos2
    PORT(
         Dint : IN  std_logic_vector(25 downto 0);
         Dout : OUT  std_logic_vector(27 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Dint : std_logic_vector(25 downto 0) := (others => '0');

 	--Outputs
   signal Dout : std_logic_vector(27 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mos2 PORT MAP (
          Dint => Dint,
          Dout => Dout
        );

   -- Clock process definitions
   --<clock>_process :process
   --begin
		--<clock> <= '0';
		--wait for <clock>_period/2;
		--<clock> <= '1';
		--wait for <clock>_period/2;
   --end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      --wait for 20 ns;
	 
	  wait for 20 ns;
	  Dint<= "11110000111100001111000011";
	  wait for 20 ns;
	  Dint<= "11000000111100001111000000";
	  wait for 20 ns;
	  Dint<= "01000000000000001111111111";
	  wait for 20 ns;
	  Dint<= "01010101010101010101010101";
   end process;

END;
