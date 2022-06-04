LIBRARY IEEE;
USE ieee.std_logic_1164.all;
---------------------------------------------------------------------
ENTITY  PONG IS
	PORT(	rst		:	IN		STD_LOGIC;
			clk		:	IN		STD_LOGIC;
			ena		:	IN		STD_LOGIC;
			player1	:	IN		STD_LOGIC_VECTOR(1 DOWNTO 0);
			player2	:	IN 	STD_LOGIC_VECTOR(1 DOWNTO 0);
			sseg1		:	OUT	STD_LOGIC_VECTOR(6 DOWNTO 0);
			sseg2		:	OUT	STD_LOGIC_VECTOR(6 DOWNTO 0);
			pines		:	OUT	STD_LOGIC_VECTOR(31 DOWNTO 0));
END ENTITY PONG;
------------------------------------------------------------------------
ARCHITECTURE functional	OF PONG IS
	SIGNAL goal_player1, goal_player2 : STD_LOGIC;
	SIGNAL racket1, racket2	:	STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL led1_racket1, led2_racket1, led3_racket1, led1_racket2, led2_racket2, led3_racket2 : STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL xball : STD_LOGIC_VECTOR(3 DOWNTO 0); 
	SIGNAL yball : STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL matrix :	STD_LOGIC_VECTOR(127 DOWNTO 0);
	SIGNAL display	:	STD_LOGIC_VECTOR(127 DOWNTO 0);
	SIGNAL score1 : STD_LOGIC_VECTOR(3 DOWNTO 0); 
	SIGNAL score2 : STD_LOGIC_VECTOR(3 DOWNTO 0); 
	SIGNAL clk_fps	:	STD_LOGIC;
	SIGNAL win1, win2	:	STD_LOGIC;
	SIGNAL vel_ball : STD_LOGIC_VECTOR (23 DOWNTO 0);	
	
BEGIN

------------------------------------------------------------------

------------------------------------------------------------------
	player1_rack:  ENTITY work.rackets
						PORT MAP(	player 		 => player1,
										rack_current => racket1,
										led1_current => led1_racket1,
										led2_current => led2_racket1,
										led3_current => led3_racket1,
										goal_player1 => goal_player1,
										goal_player2 => goal_player2,
										clk			 => clk,
										rst 			 => rst,
										ena 			 => ena);
-----------------------------------------------------------------
	player2_rack:  ENTITY work.rackets
						PORT MAP(	player 		 => player2,
										rack_current => racket2,
										led1_current => led1_racket2,
										led2_current => led2_racket2,
										led3_current => led3_racket2,
										goal_player1 => goal_player1,
										goal_player2 => goal_player2,
										clk			 => clk,
										rst 			 => rst,
										ena 			 => ena);
-----------------------------------------------------------------
ball_mat: ENTITY work.ball
			 PORT MAP(	led1_racket1 => led1_racket1,
							led2_racket1 => led2_racket1,
							led3_racket1 => led3_racket1,
							led1_racket2 => led1_racket2,
							led2_racket2 => led2_racket2,
							led3_racket2 => led3_racket2,
							score1   	 => score1,
							score2		 => score2,
							yball			 => yball,
							xball			 => xball,
							vel_ball		 => vel_ball,
							goal_player1 => goal_player1,
							goal_player2 => goal_player2,
							clk			 => clk,
							rst   		 => rst,
							ena 			 => ena);
-------------------------------------------------------------------
	marcador: ENTITY work.score_game
				 PORT MAP(	goal_player1 => goal_player1,
								goal_player2 => goal_player2,
								sseg1 		 => sseg1,
								score1   	 => score1,
								score2		 => score2,
								sseg2 		 => sseg2,
								clk 			 => clk,
								rst 			 => rst,
								win1			 => win1,
								win2 			 => win2,
								ena 			 => ena);
------------------------------------------------------------------
	matriz: ENTITY work.game_to_matrix
						PORT MAP(	xball  => xball,
										yball  => yball,
										rack1  => racket1,
										rack2  => racket2,
										matrix => matrix);
------------------------------------------------------------------
	FSM_display: ENTITY work.ledMatrix_Controller
						PORT MAP( clk 		=> clk,
									 rst 		=> rst,
									 LED 		=> matrix,
									 win1		=> win1,
									 win2		=> win2,
									 tick 	=> clk_fps,
									 PIN_1   => pines(0),
									 PIN_2   => pines(1),
									 PIN_3   => pines(2),
									 PIN_4   => pines(3),
									 PIN_5   => pines(4),
									 PIN_6   => pines(5),
									 PIN_7   => pines(6),
									 PIN_8   => pines(7),
									 PIN_9   => pines(8),
									 PIN_10  => pines(9),
									 PIN_11  => pines(10),
									 PIN_12  => pines(11),
									 PIN_13  => pines(12),
									 PIN_14  => pines(13),
									 PIN_15  => pines(14),
									 PIN_16  => pines(15),
									 PIN_17  => pines(16),
									 PIN_18  => pines(17),
									 PIN_19  => pines(18),
									 PIN_20  => pines(19),
									 PIN_21  => pines(20),
									 PIN_22  => pines(21),
									 PIN_23  => pines(22),
									 PIN_24  => pines(23),
									 PIN_25  => pines(24),
									 PIN_26  => pines(25),
									 PIN_27  => pines(26),
									 PIN_28  => pines(27),
									 PIN_29  => pines(28),
									 PIN_30  => pines(29),
									 PIN_31  => pines(30),
									 PIN_32  => pines(31));
----------------------------------------------------------
	counter_fps: ENTITY work.univ_bin_counter
		GENERIC MAP(N => 13)
		PORT MAP(
					clk		=> clk,
					rst		=> rst,
					ena		=> ena,
					syn_clr	=> '0',
					load		=> '0',
					up			=> '1',
					d			=> "1101101011000",
					max_tick	=>	clk_fps);
	
END ARCHITECTURE;