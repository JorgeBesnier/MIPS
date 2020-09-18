library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL; 
 
ENTITY tb_ram IS
END tb_ram;
 
ARCHITECTURE behavior OF tb_ram IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Mmemoria
    PORT(
         WRITE_ENABLE : IN  std_logic;
         READ_ENABLE : IN  std_logic;
         CLK : IN  std_logic;
         RW_ADRDRESS : IN  std_logic_vector(31 downto 0);
         WRITE_DATA : IN  std_logic_vector(31 downto 0);
         READ_DATA : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal WRITE_ENABLE : std_logic := '0';
   signal READ_ENABLE : std_logic := '0';
   signal CLK : std_logic := '0';
   signal RW_ADRDRESS : std_logic_vector(31 downto 0) := (others => '0');
   signal WRITE_DATA : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal READ_DATA : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Mmemoria PORT MAP (
          WRITE_ENABLE => WRITE_ENABLE,
          READ_ENABLE => READ_ENABLE,
          CLK => CLK,
          RW_ADRDRESS => RW_ADRDRESS,
          WRITE_DATA => WRITE_DATA,
          READ_DATA => READ_DATA
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
		--palabras de 0 a 31
		-- write a la palabra 1
		wait for 50ns;
			WRITE_ENABLE <= '1';
			READ_ENABLE  <= '0';
			RW_ADRDRESS <= x"00000004"; --escribir en palabra 4
			WRITE_DATA  <= x"00000001"; -- valor que se escribe en la palabra
		
		-- read la palabra 0 para verificar que la conversion esta bien
		wait for 50ns;
			WRITE_ENABLE <= '0';
			READ_ENABLE  <= '1';
			RW_ADRDRESS <= x"00000000"; --escribir en palabra 4
			WRITE_DATA  <= x"00000001"; -- valor que se escribe en la palabra
		
		-- read la palabra 1 read de 0 antes para verificar que si se almaceno el valor indefinidamente
		wait for 50ns;
			WRITE_ENABLE <= '0';
			READ_ENABLE  <= '1';
			RW_ADRDRESS <= x"00000004"; --escribir en palabra 4
			WRITE_DATA  <= x"00000001"; -- valor que se escribe en la palabra
		
		-- read la palabra 0 verificar que no paso algo extrano despues de leer el valor que escribimos
		wait for 50ns;
			WRITE_ENABLE <= '0';
			READ_ENABLE  <= '1';
			RW_ADRDRESS <= x"00000000"; --escribir en palabra 4
			WRITE_DATA  <= x"00000001"; -- valor que se escribe en la palabra	
		
		-- Verificar que no se pueda hacer el read y write al mismo tiempo
		wait for 50ns;
			WRITE_ENABLE <= '1';
			READ_ENABLE  <= '1';
			RW_ADRDRESS <= x"00000000"; --escribir en palabra 4
			WRITE_DATA  <= x"00000001"; -- valor que se escribe en la palabra	
		wait for 50ns;
			WRITE_ENABLE <= '0';
			READ_ENABLE  <= '0';
			RW_ADRDRESS <= x"00000000"; --escribir en palabra 4
			WRITE_DATA  <= x"00000001"; -- valor que se escribe en la palabra	
		
      wait;
   end process;

END;
