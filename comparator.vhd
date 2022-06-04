LIBRARY IEEE;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
--------------------------------------
ENTITY comparator IS
    GENERIC ( MAX_WIDTH   : INTEGER:= 4);
	 PORT (    x           : IN STD_LOGIC_VECTOR(MAX_WIDTH-1 DOWNTO 0);
	           y           : IN STD_LOGIC_VECTOR(MAX_WIDTH-1 DOWNTO 0);
				  eq          : OUT STD_LOGIC);
				  
END ENTITY;
---------------------------------------
ARCHITECTURE gatelevel OF comparator IS 
BEGIN
    eq <= '1' when x = y else '0';
end ARCHITECTURE;