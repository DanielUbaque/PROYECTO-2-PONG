LIBRARY ieee;
USE ieee.std_logic_1164.all;
------------------------------------------------
ENTITY game_to_matrix IS
	PORT ( xball	: IN	STD_LOGIC_VECTOR(3 DOWNTO 0);
			 yball	: IN	STD_LOGIC_VECTOR(3 DOWNTO 0);
			 rack1	: IN	STD_LOGIC_VECTOR(7 DOWNTO 0);
			 rack2	: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			 matrix	: OUT STD_LOGIC_VECTOR(127 DOWNTO 0));
END ENTITY game_to_matrix;
------------------------------------------------
ARCHITECTURE behaviour OF game_to_matrix IS
BEGIN

	matrix(14 DOWNTO 1) <="00000000000001" WHEN xball = "0001" AND yball = "0000" ELSE
								 "00000000000010" WHEN xball = "0010" AND yball = "0000" ELSE
								 "00000000000100" WHEN xball = "0011" AND yball = "0000" ELSE
								 "00000000001000" WHEN xball = "0100" AND yball = "0000" ELSE
								 "00000000010000" WHEN xball = "0101" AND yball = "0000" ELSE
								 "00000000100000" WHEN xball = "0110" AND yball = "0000" ELSE
								 "00000001000000" WHEN xball = "0111" AND yball = "0000" ELSE
								 "00000010000000" WHEN xball = "1000" AND yball = "0000" ELSE
								 "00000100000000" WHEN xball = "1001" AND yball = "0000" ELSE
								 "00001000000000" WHEN xball = "1010" AND yball = "0000" ELSE
								 "00010000000000" WHEN xball = "1011" AND yball = "0000" ELSE
								 "00100000000000" WHEN xball = "1100" AND yball = "0000" ELSE
								 "01000000000000" WHEN xball = "1101" AND yball = "0000" ELSE
								 "10000000000000" WHEN xball = "1110" AND yball = "0000" ELSE
								 "00000000000000";
	matrix(30 DOWNTO 17)<="00000000000001" WHEN xball = "0001" AND yball = "0001" ELSE
								 "00000000000010" WHEN xball = "0010" AND yball = "0001" ELSE
								 "00000000000100" WHEN xball = "0011" AND yball = "0001" ELSE
								 "00000000001000" WHEN xball = "0100" AND yball = "0001" ELSE
								 "00000000010000" WHEN xball = "0101" AND yball = "0001" ELSE
								 "00000000100000" WHEN xball = "0110" AND yball = "0001" ELSE
								 "00000001000000" WHEN xball = "0111" AND yball = "0001" ELSE
								 "00000010000000" WHEN xball = "1000" AND yball = "0001" ELSE
								 "00000100000000" WHEN xball = "1001" AND yball = "0001" ELSE
								 "00001000000000" WHEN xball = "1010" AND yball = "0001" ELSE
								 "00010000000000" WHEN xball = "1011" AND yball = "0001" ELSE
								 "00100000000000" WHEN xball = "1100" AND yball = "0001" ELSE
								 "01000000000000" WHEN xball = "1101" AND yball = "0001" ELSE
								 "10000000000000" WHEN xball = "1110" AND yball = "0001" ELSE
								 "00000000000000";
	matrix(46 DOWNTO 33)<="00000000000001" WHEN xball = "0001" AND yball = "0010" ELSE
								 "00000000000010" WHEN xball = "0010" AND yball = "0010" ELSE
								 "00000000000100" WHEN xball = "0011" AND yball = "0010" ELSE
								 "00000000001000" WHEN xball = "0100" AND yball = "0010" ELSE
								 "00000000010000" WHEN xball = "0101" AND yball = "0010" ELSE
								 "00000000100000" WHEN xball = "0110" AND yball = "0010" ELSE
								 "00000001000000" WHEN xball = "0111" AND yball = "0010" ELSE
								 "00000010000000" WHEN xball = "1000" AND yball = "0010" ELSE
								 "00000100000000" WHEN xball = "1001" AND yball = "0010" ELSE
								 "00001000000000" WHEN xball = "1010" AND yball = "0010" ELSE
								 "00010000000000" WHEN xball = "1011" AND yball = "0010" ELSE
								 "00100000000000" WHEN xball = "1100" AND yball = "0010" ELSE
								 "01000000000000" WHEN xball = "1101" AND yball = "0010" ELSE
								 "10000000000000" WHEN xball = "1110" AND yball = "0010" ELSE
								 "00000000000000";
	matrix(62 DOWNTO 49)<="00000000000001" WHEN xball = "0001" AND yball = "0011" ELSE
								 "00000000000010" WHEN xball = "0010" AND yball = "0011" ELSE
								 "00000000000100" WHEN xball = "0011" AND yball = "0011" ELSE
								 "00000000001000" WHEN xball = "0100" AND yball = "0011" ELSE
								 "00000000010000" WHEN xball = "0101" AND yball = "0011" ELSE
								 "00000000100000" WHEN xball = "0110" AND yball = "0011" ELSE
								 "00000001000000" WHEN xball = "0111" AND yball = "0011" ELSE
								 "00000010000000" WHEN xball = "1000" AND yball = "0011" ELSE
								 "00000100000000" WHEN xball = "1001" AND yball = "0011" ELSE
								 "00001000000000" WHEN xball = "1010" AND yball = "0011" ELSE
								 "00010000000000" WHEN xball = "1011" AND yball = "0011" ELSE
								 "00100000000000" WHEN xball = "1100" AND yball = "0011" ELSE
								 "01000000000000" WHEN xball = "1101" AND yball = "0011" ELSE
								 "10000000000000" WHEN xball = "1110" AND yball = "0011" ELSE
								 "00000000000000";
	matrix(78 DOWNTO 65)<="00000000000001" WHEN xball = "0001" AND yball = "0100" ELSE
								 "00000000000010" WHEN xball = "0010" AND yball = "0100" ELSE
								 "00000000000100" WHEN xball = "0011" AND yball = "0100" ELSE
								 "00000000001000" WHEN xball = "0100" AND yball = "0100" ELSE
								 "00000000010000" WHEN xball = "0101" AND yball = "0100" ELSE
								 "00000000100000" WHEN xball = "0110" AND yball = "0100" ELSE
								 "00000001000000" WHEN xball = "0111" AND yball = "0100" ELSE
								 "00000010000000" WHEN xball = "1000" AND yball = "0100" ELSE
								 "00000100000000" WHEN xball = "1001" AND yball = "0100" ELSE
								 "00001000000000" WHEN xball = "1010" AND yball = "0100" ELSE
								 "00010000000000" WHEN xball = "1011" AND yball = "0100" ELSE
								 "00100000000000" WHEN xball = "1100" AND yball = "0100" ELSE
								 "01000000000000" WHEN xball = "1101" AND yball = "0100" ELSE
								 "10000000000000" WHEN xball = "1110" AND yball = "0100" ELSE
								 "00000000000000";
	matrix(94 DOWNTO 81)<="00000000000001" WHEN xball = "0001" AND yball = "0101" ELSE
								 "00000000000010" WHEN xball = "0010" AND yball = "0101" ELSE
								 "00000000000100" WHEN xball = "0011" AND yball = "0101" ELSE
								 "00000000001000" WHEN xball = "0100" AND yball = "0101" ELSE
								 "00000000010000" WHEN xball = "0101" AND yball = "0101" ELSE
								 "00000000100000" WHEN xball = "0110" AND yball = "0101" ELSE
								 "00000001000000" WHEN xball = "0111" AND yball = "0101" ELSE
								 "00000010000000" WHEN xball = "1000" AND yball = "0101" ELSE
								 "00000100000000" WHEN xball = "1001" AND yball = "0101" ELSE
								 "00001000000000" WHEN xball = "1010" AND yball = "0101" ELSE
								 "00010000000000" WHEN xball = "1011" AND yball = "0101" ELSE
								 "00100000000000" WHEN xball = "1100" AND yball = "0101" ELSE
								 "01000000000000" WHEN xball = "1101" AND yball = "0101" ELSE
								 "10000000000000" WHEN xball = "1110" AND yball = "0101" ELSE
								 "00000000000000";
	matrix(110 DOWNTO 97)<="00000000000001" WHEN xball = "0001" AND yball = "0110" ELSE
								 "00000000000010" WHEN xball = "0010" AND yball = "0110" ELSE
								 "00000000000100" WHEN xball = "0011" AND yball = "0110" ELSE
								 "00000000001000" WHEN xball = "0100" AND yball = "0110" ELSE
								 "00000000010000" WHEN xball = "0101" AND yball = "0110" ELSE
								 "00000000100000" WHEN xball = "0110" AND yball = "0110" ELSE
								 "00000001000000" WHEN xball = "0111" AND yball = "0110" ELSE
								 "00000010000000" WHEN xball = "1000" AND yball = "0110" ELSE
								 "00000100000000" WHEN xball = "1001" AND yball = "0110" ELSE
								 "00001000000000" WHEN xball = "1010" AND yball = "0110" ELSE
								 "00010000000000" WHEN xball = "1011" AND yball = "0110" ELSE
								 "00100000000000" WHEN xball = "1100" AND yball = "0110" ELSE
								 "01000000000000" WHEN xball = "1101" AND yball = "0110" ELSE
								 "10000000000000" WHEN xball = "1110" AND yball = "0110" ELSE
								 "00000000000000";
	matrix(126 DOWNTO 113)<="00000000000001" WHEN xball = "0001" AND yball = "0111" ELSE
								 "00000000000010" WHEN xball = "0010" AND yball = "0111" ELSE
								 "00000000000100" WHEN xball = "0011" AND yball = "0111" ELSE
								 "00000000001000" WHEN xball = "0100" AND yball = "0111" ELSE
								 "00000000010000" WHEN xball = "0101" AND yball = "0111" ELSE
								 "00000000100000" WHEN xball = "0110" AND yball = "0111" ELSE
								 "00000001000000" WHEN xball = "0111" AND yball = "0111" ELSE
								 "00000010000000" WHEN xball = "1000" AND yball = "0111" ELSE
								 "00000100000000" WHEN xball = "1001" AND yball = "0111" ELSE
								 "00001000000000" WHEN xball = "1010" AND yball = "0111" ELSE
								 "00010000000000" WHEN xball = "1011" AND yball = "0111" ELSE
								 "00100000000000" WHEN xball = "1100" AND yball = "0111" ELSE
								 "01000000000000" WHEN xball = "1101" AND yball = "0111" ELSE
								 "10000000000000" WHEN xball = "1110" AND yball = "0111" ELSE
								 "00000000000000";
								 
	matrix(0)  	<= '1' WHEN rack1(7)='1' ELSE '0';
	matrix(16) 	<= '1' WHEN rack1(6)='1' ELSE '0';
	matrix(32) 	<= '1' WHEN rack1(5)='1' ELSE '0';
	matrix(48) 	<= '1' WHEN rack1(4)='1' ELSE '0';
	matrix(64) 	<= '1' WHEN rack1(3)='1' ELSE '0';
	matrix(80) 	<= '1' WHEN rack1(2)='1' ELSE '0';
	matrix(96) 	<= '1' WHEN rack1(1)='1' ELSE '0';
	matrix(112)	<= '1' WHEN rack1(0)='1' ELSE '0';
	matrix(15) 	<= '1' WHEN rack2(7)='1' ELSE '0';
	matrix(31) 	<= '1' WHEN rack2(6)='1' ELSE '0';
	matrix(47) 	<= '1' WHEN rack2(5)='1' ELSE '0';
	matrix(63) 	<= '1' WHEN rack2(4)='1' ELSE '0';
	matrix(79) 	<= '1' WHEN rack2(3)='1' ELSE '0';
	matrix(95) 	<= '1' WHEN rack2(2)='1' ELSE '0';
	matrix(111)	<= '1' WHEN rack2(1)='1' ELSE '0';
	matrix(127)	<= '1' WHEN rack2(0)='1' ELSE '0';
END ARCHITECTURE;