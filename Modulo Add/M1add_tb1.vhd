LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

ENTITY M1add_tb1 IS
END M1add_tb1;
 
ARCHITECTURE behavior OF M1add_tb1 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT M1add
    PORT(
         a : IN  std_logic_vector(31 downto 0);
         b : IN  std_logic_vector(31 downto 0);
         c : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(31 downto 0) := (others => '0');
   signal b : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal c : std_logic_vector(31 downto 0);

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: M1add PORT MAP (
          a => a,
          b => b,
          c => c
        );

 --Stimulus process
 stim_proc: process
   begin	
		wait for 20 ns;
		a<= "00000000000000000000000000000000";
		b<= "00000000000000000000000000000000";
		wait for 20 ns;
		a <= "10000000000000000000000000000001";
		b <= "00000000000000000000000000000001";
		wait for 20 ns;
		a <= "11111111111111111111111111111111";
		b <= "11111111111111111111111111111111";
		wait for 20 ns;
		a <= "11111111111111111111111011111111";
		b <= "11111111111111111111111111111111";
   end process;

END;
