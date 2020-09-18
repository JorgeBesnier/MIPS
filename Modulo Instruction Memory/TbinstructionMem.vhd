--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:55:26 09/08/2020
-- Design Name:   
-- Module Name:   C:/PROJECTS/XILINX/Practica3/TbinstructionMem.vhd
-- Project Name:  Practica3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: instructionMem
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
 
ENTITY TbinstructionMem IS
END TbinstructionMem;
 
ARCHITECTURE behavior OF TbinstructionMem IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT instructionMem
    PORT(
         READ_ADDRESS : IN  std_logic_vector(31 downto 0);
         INSTRUCTION : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal READ_ADDRESS : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal INSTRUCTION : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
  -- constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: instructionMem PORT MAP (
          READ_ADDRESS => READ_ADDRESS,
          INSTRUCTION => INSTRUCTION
        );

   	
	
	
   stim_proc: process
   begin		
      -- hold reset state for 50 ns.
      wait for 50 ns;	
      -- insert stimulus here 
		READ_ADDRESS <= x"00000000";
		wait for 50 ns;
		READ_ADDRESS <= x"00000004";
		wait for 50 ns;
		READ_ADDRESS <= x"0000000C";
																																							

      wait;
   end process;

END;
