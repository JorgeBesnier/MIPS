library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL; 

ENTITY tbMalu IS
END tbMalu;
 
ARCHITECTURE behavior OF tbMalu IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Malu
    PORT(
         a : IN  std_logic_vector(31 downto 0);
         b : IN  std_logic_vector(31 downto 0);
         cntrl : IN  std_logic_vector(2 downto 0);
         zero : OUT  std_logic;
         result : INOUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(31 downto 0) := (others => '0');
   signal b : std_logic_vector(31 downto 0) := (others => '0');
   signal cntrl : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal zero : std_logic;
   signal result : std_logic_vector(31 downto 0);

 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Malu PORT MAP (
          a => a,
          b => b,
          cntrl => cntrl,
          zero => zero,
          result => result
       );
    -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;
			cntrl<= "000";
			a<= x"00000001";
			b<= x"00000101";
      wait for 100 ns;
			cntrl<= "001";
			a<= x"00000001";
			b<= x"00000101";
      wait for 100 ns;
			cntrl<= "010";
		wait for 100 ns;
			cntrl<= "011";
		wait for 100 ns;
			cntrl<= "100";
		wait for 100 ns;
			a<= x"00000001";
			b<= x"00000101";
			cntrl<= "111";	
		wait for 100 ns;
			a<= x"00000101";
			b<= x"00000001";
			cntrl<= "111";	
		wait for 100 ns;
			a<= x"00000001";
			b<= x"00000101";
			cntrl<= "110";	
		wait for 100 ns;
			a<= x"00000101";
			b<= x"00000001";
			cntrl<= "110";

      wait;
   end process;

END;
