LIBRARY IEEE;
USE ieee.std_logic_1164.all;
----------------------------------------------------------
ENTITY mux2_1_with_select_coord IS
	GENERIC ( MAX_WIDTH   : INTEGER:= 4);
	PORT(	sel		:	IN		STD_LOGIC_VECTOR(7 DOWNTO 0);
			y1,y2,y3	:	OUT	STD_LOGIC_VECTOR(MAX_WIDTH-1 DOWNTO 0));
			
END ENTITY mux2_1_with_select_coord;
----------------------------------------------------------
ARCHITECTURE functional OF mux2_1_with_select_coord IS
BEGIN
	WITH sel SELECT
		y1	<=	"0000"	WHEN	"11100000",
				"0001"	WHEN	"01110000",
				"0010"	WHEN	"00111000",
				"0011"	WHEN	"00011100",
				"0100"	WHEN	"00001110",
				"0101"	WHEN	"00000111",
				 NULL	WHEN	OTHERS;
				
	WITH sel SELECT
		y2	<=	"0001"	WHEN	"11100000",
				"0010"	WHEN	"01110000",
				"0011"	WHEN	"00111000",
				"0100"	WHEN	"00011100",
				"0101"	WHEN	"00001110",
				"0110"	WHEN	"00000111",
				NULL     WHEN	OTHERS;
				
	WITH sel SELECT
		y3	<=	"0010"	WHEN	"11100000",
				"0011"	WHEN	"01110000",
				"0100"	WHEN	"00111000",
				"0101"	WHEN	"00011100",
				"0110"	WHEN	"00001110",
				"0111"	WHEN	"00000111",
				NULL	WHEN	OTHERS;

					

END ARCHITECTURE functional;