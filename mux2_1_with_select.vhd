LIBRARY IEEE;
USE ieee.std_logic_1164.all;
----------------------------------------------------------
ENTITY mux2_1_with_select IS
	GENERIC ( MAX_WIDTH   : INTEGER:= 4);
	PORT(	x1		:	IN	STD_LOGIC_VECTOR(MAX_WIDTH-1 DOWNTO 0);
			x2		:	IN	STD_LOGIC_VECTOR(MAX_WIDTH-1 DOWNTO 0);
			sel	:	IN	STD_LOGIC_VECTOR(1 DOWNTO 0);
			y		:	OUT	STD_LOGIC_VECTOR(MAX_WIDTH-1 DOWNTO 0));
END ENTITY mux2_1_with_select;
----------------------------------------------------------
ARCHITECTURE functional OF mux2_1_with_select IS
BEGIN
	WITH sel SELECT
		y	<=	x1	WHEN	"00",
				x2 WHEN  OTHERS;
					
				
END ARCHITECTURE functional;