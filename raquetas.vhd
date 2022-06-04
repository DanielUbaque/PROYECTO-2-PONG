LIBRARY IEEE;
USE ieee.std_logic_1164.all;
-------------------------------------------------------------------------------------
ENTITY  rackets IS
	PORT(	rst				:	IN	STD_LOGIC;
			clk				:	IN	STD_LOGIC;
			ena				:	IN	STD_LOGIC;
			player			:	IN	STD_LOGIC_VECTOR(1 DOWNTO 0);
			goal_player1	:	IN	STD_LOGIC;
			goal_player2	:	IN	STD_LOGIC;
			rack_current 	: 	OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
			led1_current	: 	OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			led2_current	: 	OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			led3_current	: 	OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END ENTITY rackets;
-------------------------------------------------------------------------------------
ARCHITECTURE state_machine	OF rackets IS

	TYPE state IS (down, up, static, rev10, rev01);
	SIGNAL pr_state, nx_state : state;
	
	SIGNAL rack_next, rack_mov :	STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL sel_rack 				:	STD_LOGIC_VECTOR(1 DOWNTO 0);
	SIGNAL rack_current_s 		:	STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL mxtick_rack 			:  STD_LOGIC;
	SIGNAL rst_rack  				:  STD_LOGIC;
	SIGNAL led1_current_s, led2_current_s, led3_current_s : STD_LOGIC_VECTOR(3 DOWNTO 0);

BEGIN
led1_current <= led1_current_s;
led2_current <= led2_current_s;
led3_current <= led3_current_s;

rack_current <= rack_current_s;
--------------------------------Sequential section-----------------------------------
PROCESS (rst, mxtick_rack)
BEGIN

		IF	(rst	=	'1')THEN
			pr_state	<=	static;
		ELSIF	(rising_edge(clk)) THEN
			IF (mxtick_rack = '1') THEN
			pr_state	<=	nx_state;
		END IF;
			END IF;
	END PROCESS ;
	
PROCESS (goal_player1, goal_player2)
BEGIN

		IF	(goal_player1	=	'1' AND goal_player2 = '0')THEN
			rst_rack	<=	'1';
		ELSIF(goal_player2	=	'1' AND goal_player1 = '0')THEN
			rst_rack	<=	'1';
		ELSIF(goal_player2	=	'0' AND goal_player1 = '0')THEN
			rst_rack	<=	'0';
		ELSIF(rst ='1') THEN
			rst_rack	<=	'1';
		ELSE
			rst_rack <= '0';
			END IF;
	END PROCESS ;

--------------------------------------------------------------------------------------
flip_flop_rack: ENTITY work. my_dff
					 GENERIC MAP(MAX_WIDTH => 8,
				  					INITIAL => "00111000")
					  PORT MAP( clk => mxtick_rack,
					  			   ena => ena,
									rst => rst_rack,
									d   => rack_next,
									q   => rack_current_s);
--------------------------------------------------------------------------------------
mux_rack:ENTITY work.mux2_1_with_select
			GENERIC MAP (	MAX_WIDTH	=>	8)
			PORT MAP( x1	=> rack_current_s,
						 x2	=> rack_mov,
						 sel	=> sel_rack,
						 y		=> rack_next);
-------------------------------------------------------------------------------------
shifter_racket:ENTITY work.shifter
					GENERIC MAP(N => 8)
					PORT MAP(sel => sel_rack,
			 					x	 => rack_current_s,
								y 	 => rack_mov);
-------------------------------------------------------------------------------------
mux_leds: ENTITY work. mux2_1_with_select_coord
			 GENERIC MAP (	MAX_WIDTH	=>	4)
			 PORT MAP ( sel => rack_current_s,
  						   y1	 => led1_current_s,
							y2	 => led2_current_s,
							y3	 => led3_current_s);
------------------------------------------------------------------------------------------
									
CLOCK:ENTITY work.univ_bin_counter
		GENERIC MAP(N => 23)
		PORT MAP(
					clk		=> clk,
					rst		=> rst,
					ena		=> ena,
					syn_clr	=> '0',
					load		=> '0',
					up			=> '1',
					d			=> "10011000100101101000000",
					max_tick	=>	mxtick_rack);
		


PROCESS(player, pr_state, rack_current_s)
BEGIN
	CASE pr_state IS
		WHEN static =>
			sel_rack <= "00";
			IF (player = "10") THEN
				nx_state <= rev10;
			ELSIF (player = "01") THEN 
				nx_state <= rev01;
			ELSE
				nx_state <= static;
			END IF;
			
		WHEN rev10 =>
			sel_rack <= "00";
			IF (rack_current_s="00000111" AND player = "10") THEN
				nx_state <= static;
			ELSIF(player ="10") THEN
				nx_state <= down;
			ELSE
				nx_state <= static;
			END IF;
			
		WHEN rev01 =>
			sel_rack <= "00";
			IF (rack_current_s="11100000" AND player = "01") THEN
				nx_state <= static;
			ELSIF(player ="01") THEN
				nx_state <= up;
			ELSE
				nx_state <= static;
			END IF;
			
		WHEN down =>
		
			sel_rack <= "01";
			nx_state <= static;

		WHEN up =>
			sel_rack <= "10"; 
			nx_state <= static;

			END CASE;
	END PROCESS;
END ARCHITECTURE;