
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY TB1M1programCounter IS
END TB1M1programCounter;
 
ARCHITECTURE behavior OF TB1M1programCounter IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT M1ProgramCounter
    PORT(
         D : IN  std_logic_vector(31 downto 0);
         Q : OUT  std_logic_vector(31 downto 0);
         RESET : IN  std_logic;
         CLK : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal D : std_logic_vector(31 downto 0) := (others => '0');
   signal RESET : std_logic := '0';
   signal CLK : std_logic := '0';

 	--Outputs
   signal Q : std_logic_vector(31 downto 0);

	--constants
	constant CLK_period : time := 10 ns;
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: M1ProgramCounter PORT MAP (
          D => D,
          Q => Q,
          RESET => RESET,
          CLK => CLK
        );
 
	clk_process : process
	begin
		CLK<= '0';
		wait for CLK_period/2;
		CLK<= '1';
		wait for CLK_period/2;
	end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
		
		reset <= '1';
		
		wait for 50ns;
		reset <= '0';
		D <= "00000000000000000000000000000000";
		
		wait for 50ns;
		reset <= '0';
		D <= "11111111111111111111111111111111";
		
		wait for 50ns;
		reset <= '0';
		D <= "00111111111111111111111111111111";
		
		wait for 50ns;
		reset <= '0';
		D <= "00011111111100000000111111111111";
		

		wait for 50ns;
		reset <= '1';
		D <= "00111111111111111111100000000000";
      wait;
   end process;

END;
