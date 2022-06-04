
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY shifter IS
    GENERIC (N : INTEGER :=8);
	 PORT (sel	: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	       x 	: IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			 y :	 OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0));
END ENTITY;
-----------------------------------------------------------------------
ARCHITECTURE rtl OF shifter IS
BEGIN
	WITH sel SELECT
	y 	<=	 x 							 WHEN 	"00",
			'0' & x(N-1 DOWNTO 1) 	 WHEN 	"01", 
			 x(N-2 DOWNTO 0) & '0'   WHEN 	"10", 
	       x		            		 WHEN 	OTHERS;      
END ARCHITECTURE;