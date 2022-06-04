LIBRARY IEEE;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
--------------------------------------
ENTITY comparator3 IS
    GENERIC ( MAX_WIDTH   : INTEGER:= 4);
	 PORT (    x_b,y_b           : IN STD_LOGIC_VECTOR(MAX_WIDTH-1 DOWNTO 0);
	           x_r           : IN STD_LOGIC_VECTOR(MAX_WIDTH-1 DOWNTO 0);
				  
				  LED1,LED2,LED3      : IN STD_LOGIC_VECTOR(MAX_WIDTH-1 DOWNTO 0);
				  
				  eq          : OUT STD_LOGIC);
				  
END ENTITY;
---------------------------------------
ARCHITECTURE gatelevel OF comparator3 IS 
BEGIN
    eq <= '1' when ((y_b /= (LED1 AND LED2 AND LED3)) AND (x_b = x_r)) else '0';

end ARCHITECTURE;