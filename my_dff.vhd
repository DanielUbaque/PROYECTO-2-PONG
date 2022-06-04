LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
-------------------------------------------------------------------
ENTITY my_dff	IS	
	GENERIC( MAX_WIDTH   : INTEGER:= 4;
				INITIAL		: STD_LOGIC_VECTOR(7 DOWNTO 0));
	PORT	(	clk	:	IN		STD_LOGIC;
				rst	:	IN		STD_LOGIC;
				ena	:	IN		STD_LOGIC;
				d		:	IN		STD_LOGIC_VECTOR(MAX_WIDTH-1 DOWNTO 0);
				q		:	OUT	STD_LOGIC_VECTOR(MAX_WIDTH-1 DOWNTO 0));
END ENTITY;
-------------------------------------------------------------------
ARCHITECTURE rtl OF my_dff IS 
BEGIN

	my_tff:	PROCESS(clk, ena, rst)
	BEGIN	
		IF(rst = '1')	THEN
			q <= INITIAL(MAX_WIDTH-1 DOWNTO 0);
		ELSIF	(rising_edge(clk)) THEN
			IF	(ena = '1') THEN
				q	<= d;
			END IF;
		END IF;
	END PROCESS;
END ARCHITECTURE;
