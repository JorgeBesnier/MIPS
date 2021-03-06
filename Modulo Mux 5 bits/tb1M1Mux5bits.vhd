LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY tb1M1Mux5bits IS
END tb1M1Mux5bits;
 
ARCHITECTURE behavior OF tb1M1Mux5bits IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT tb1M1Mux5bits
    PORT(
         a : IN  std_logic_vector(4 downto 0);
         b : IN  std_logic_vector(4 downto 0);
         sel : IN  std_logic;
         outMUX : OUT  std_logic_vector(4 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(4 downto 0) := (others => '0');
   signal b : std_logic_vector(4 downto 0) := (others => '0');
   signal sel : std_logic := '0';

 	--Outputs
   signal outMUX : std_logic_vector(4 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: tb1M1Mux5bits PORT MAP (
          a => a,
          b => b,
          sel => sel,
          outMUX => outMUX
        ); 

   -- Stimulus process
   stim_proc: process
   begin		

		a <= "00000";
		b <= "00001";
      wait for 50 ns;
		sel <= '0';
		a <= "00000";
		b <= "00001";
      wait for 50 ns;
		sel <= '1';
		a <= "00010";
		b <= "00001";
		wait for 50 ns;
		sel <= '0';
		a <= "00010";
		b <= "00011";
		wait for 50 ns;
		sel <= '1';
		a <= "00010";
		b <= "00011";
		wait for 50 ns;
		sel <= '1';
		a <= "00010";
		b <= "00011";
	
		wait;
   end process;

END;
