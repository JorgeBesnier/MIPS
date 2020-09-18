library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL; 

entity Mmemoria is
    Port ( 
           WRITE_ENABLE : in  STD_LOGIC;
           READ_ENABLE : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           RW_ADRDRESS : in  STD_LOGIC_VECTOR(31 DOWNTO 0);
           WRITE_DATA : in  STD_LOGIC_VECTOR(31 DOWNTO 0);
           READ_DATA : out  STD_LOGIC_VECTOR(31 DOWNTO 0));
end Mmemoria;

architecture Behavioral of Mmemoria is

	signal POSINICIAL : STD_LOGIC_VECTOR(31 DOWNTO 0) := X"00000000";
	SIGNAL RAUX : STD_LOGIC;
	SIGNAL WAUX : STD_LOGIC;
	

begin

	--LA ESCRITURA DEPENDE DEL CLK POR LO TANTO VA DENTRO DEL PROCESS
	PROCESS (WRITE_ENABLE,CLK,WRITE_DATA,RW_ADRDRESS, RAUX, WAUX, POSINICIAL)
		SUBTYPE REGISTRO IS STD_LOGIC_VECTOR (31 DOWNTO 0);
		TYPE REG_BANK IS ARRAY (0 TO 31) OF REGISTRO;
		VARIABLE ROM_MEMORY: REG_BANK:= 	(
														X"00000000",
														OTHERS => (OTHERS =>'0')
													);
	BEGIN
			IF CLK = '1' AND CLK'EVENT THEN
				IF WAUX = '1' THEN
					ROM_MEMORY((CONV_INTEGER(RW_ADRDRESS) - CONV_INTEGER(POSINICIAL))/4):= WRITE_DATA;
				ELSE NULL;
				END IF;
			ELSE NULL;
			END IF;
			--READ ES AJENO AL PULSO DE RELOJ
			IF RAUX = '1' THEN
				READ_DATA <= ROM_MEMORY((CONV_INTEGER(RW_ADRDRESS) - CONV_INTEGER(POSINICIAL))/4);
			ELSE READ_DATA <= x"00000000";
			END IF;
	END PROCESS;
		

	
	
	--LOS VALORES DE ENABLE NO PUEDEN SER AL MISMO TIEMPO
	RAUX <= (WRITE_ENABLE XOR READ_ENABLE) AND (NOT WRITE_ENABLE);
	WAUX <= (WRITE_ENABLE XOR READ_ENABLE) AND (NOT READ_ENABLE);
	

end Behavioral;
