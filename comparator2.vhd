LIBRARY IEEE;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
--------------------------------------
ENTITY comparator2 IS
    GENERIC ( MAX_WIDTH   : INTEGER:= 4);
	 PORT (    x1,x2           : IN STD_LOGIC_VECTOR(MAX_WIDTH-1 DOWNTO 0);
	           y1,y2           : IN STD_LOGIC_VECTOR(MAX_WIDTH-1 DOWNTO 0);
				  eq          : OUT STD_LOGIC);
				  
END ENTITY;
---------------------------------------
ARCHITECTURE gatelevel OF comparator2 IS 
BEGIN
    eq <= '1' when ((x1 = y1) AND (x2 = y2)) else '0';

end ARCHITECTURE;