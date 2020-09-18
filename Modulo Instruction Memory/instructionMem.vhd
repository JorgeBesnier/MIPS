----------------------------------------------------------------------------------
-- Module Name:    instructionMem - Behavioral 
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity instructionMem is
port(
      READ_ADDRESS: in std_logic_vector(31 downto 0);
		INSTRUCTION: out std_logic_vector(31 downto 0)
		);
		
end instructionMem;

architecture Behavioral of instructionMem is

type ROM is array(0 to 31) of std_logic_vector(31 downto 0);  --crando memoria 32 datos entrada x 32 de salida,  
constant ROM_MEMORY: ROM := ( x"00000000",  -- contenido de la direccion 0
										x"00000001",  -- contenido de la direccion 4
										x"00000002",  -- contenido de la direccion 8
										x"00000003",  -- contenido de la direccion C
										others => (others => '0'));
										
signal DIV: UNSIGNED(31 downto 0);
signal DIV_ADDRESS: UNSIGNED(31 downto 0);
										
begin

DIV_ADDRESS <= UNSIGNED(READ_ADDRESS);
DIV <= DIV_ADDRESS / "100"; --division del address entre 4 para acceso secuencial a las localidades

INSTRUCTION <= ROM_MEMORY(to_integer(DIV));																																						

end Behavioral;

