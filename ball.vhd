LIBRARY IEEE;
USE ieee.std_logic_1164.all;
---------------------------------------------------------------------
ENTITY  ball IS
	PORT(	rst	:	IN	STD_LOGIC;
			clk	:	IN	STD_LOGIC;
			ena	:	IN	STD_LOGIC;
			score1 :	IN	STD_LOGIC_VECTOR(3 DOWNTO 0);
			score2 :	IN	STD_LOGIC_VECTOR(3 DOWNTO 0);
			led1_racket1 :	IN	STD_LOGIC_VECTOR(3 DOWNTO 0);
			led2_racket1 :	IN	STD_LOGIC_VECTOR(3 DOWNTO 0);
			led3_racket1 :	IN	STD_LOGIC_VECTOR(3 DOWNTO 0);
			led1_racket2 :	IN	STD_LOGIC_VECTOR(3 DOWNTO 0);
			led2_racket2 :	IN	STD_LOGIC_VECTOR(3 DOWNTO 0);
			led3_racket2 :	IN	STD_LOGIC_VECTOR(3 DOWNTO 0);
			yball			: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			vel_ball 	: OUT STD_LOGIC_VECTOR (23 DOWNTO 0);	
			xball 			: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			goal_player1		: OUT STD_LOGIC;
			goal_player2		: OUT STD_LOGIC);
END ENTITY ball;
---------------------------------------------------------------------
ARCHITECTURE state_machine	OF ball IS
	
	TYPE state IS (initial1,initial2, right_x, left_x,left_up, left_down, right_up, right_down, goal1,goal2);
	SIGNAL pr_state, nx_state : state;
	
	SIGNAL left_colision1, left_colision2, left_colision3, right_colision1, right_colision2, right_colision3, top_colision, bottom_colision : STD_LOGIC;
	SIGNAL x_ball_current, y_ball_current, x_next, y_next, x_der, x_izq, y_aba, y_arr: STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL p_x, d_x, p_y, d_y : STD_LOGIC_VECTOR (3 DOWNTO 0);	
	SIGNAL sel_x, sel_y : STD_LOGIC_VECTOR(1 DOWNTO 0);
	SIGNAL clk_bola	: STD_LOGIC;
	SIGNAL ena_x, ena_y, syn_clr_x, syn_clr_y	: STD_LOGIC;
	SIGNAL limit_x1,limit_x2,limit_y, up_x, up_y : STD_LOGIC;
	SIGNAL goal_player1_s, goal_player2_s :STD_LOGIC;
	SIGNAL vel_ball_s : STD_LOGIC_VECTOR (23 DOWNTO 0);	

BEGIN
	yball <= y_ball_current;
	xball <= x_ball_current;
	
	goal_player1 <= goal_player1_s;
	goal_player2 <= goal_player2_s;
	
	vel_ball <= vel_ball_s;
	
PROCESS (score1, score2)
BEGIN

	IF	(score1	=	"0000" AND score2 = "0000")THEN
			vel_ball_s	<=	"101001111101100011000000";
		ELSIF(score1	=	"0001" AND score2 = "0001")THEN
			vel_ball_s	<=	"101001111101100011000000";
		ELSIF(score1	=	"0010" AND score2 = "0010")THEN
			vel_ball_s	<=	"101001111101100011000000";
		ELSIF(score1	=	"0011" AND score2 = "0011")THEN
			vel_ball_s	<=	"101001111101100011000000";
		ELSIF(score1	=	"0100" AND score2 = "0100")THEN
			vel_ball_s	<=	"101001111101100011000000";
		ELSIF(score1	=	"0101" AND score2 = "0101")THEN
			vel_ball_s	<=	"100010010101010001000000";
		ELSIF(score1	=	"0110" AND score2 = "0110")THEN
			vel_ball_s	<=	"011110100001001000000000";
		ELSIF(score1	=	"0111" AND score2 = "0111")THEN
			vel_ball_s	<=	"011010101100111111000000";
		ELSIF(score1	=	"1000" AND score2 = "1000")THEN
			vel_ball_s	<=	"010110111000110110000000";
		ELSIF(score1	=	"1001" AND score2 = "1001")THEN
			vel_ball_s	<=	"010011000100101101000000";
	ELSE
			vel_ball_s <= "101001111101100011000000";
	END IF;
END PROCESS ;

-------------------------------------------------------------------------------
Comparator_top: ENTITY work.comparator
								GENERIC MAP (	MAX_WIDTH	=>	4)
								PORT MAP (	x	=> y_ball_current,
												y	=> "0000",
												eq => top_colision);
-----------------------------------------------------------------------------
comparator_bottom: ENTITY work.comparator
								GENERIC MAP (	MAX_WIDTH	=>	4)
								PORT MAP (	x	=> y_ball_current,
												y	=> "0111",
												eq => bottom_colision);	
-----------------------------------------------------------------------------
comparator_left1: ENTITY work.comparator2
								GENERIC MAP (	MAX_WIDTH	=>	4)
								PORT MAP (	x1	=> led1_racket1,
												y1	=> y_ball_current,
												x2 => x_ball_current,
												y2 => "0001",
												eq => left_colision1);
-----------------------------------------------------------------------------
comparator_left2: ENTITY work.comparator2
								GENERIC MAP (	MAX_WIDTH	=>	4)
								PORT MAP (	x1	=> led2_racket1,
												y1	=> y_ball_current,
												x2 => x_ball_current,
												y2 => "0001",
												eq => left_colision2);
-----------------------------------------------------------------------------
comparator_left3: ENTITY work.comparator2
								GENERIC MAP (	MAX_WIDTH	=>	4)
								PORT MAP (	x1	=> led3_racket1,
												y1	=> y_ball_current,
												x2 => x_ball_current,
												y2 => "0001",
												eq => left_colision3);
---------------------------------------------------------------------------
comparator_right1: ENTITY work.comparator2
								GENERIC MAP (	MAX_WIDTH	=>	4)
								PORT MAP (	x1	=> y_ball_current,
												y1	=> led1_racket2,
												x2 => x_ball_current,
												y2 => "1110",
												eq => right_colision1);	
----------------------------------------------------------------------------
comparator_right2: ENTITY work.comparator2
								GENERIC MAP (	MAX_WIDTH	=>	4)
								PORT MAP (	x1	=> y_ball_current,
												y1	=> led2_racket2,
												x2 => x_ball_current,
												y2 => "1110",
												eq => right_colision2);
----------------------------------------------------------------------------
comparator_right3: ENTITY work.comparator2
								GENERIC MAP (	MAX_WIDTH	=>	4)
								PORT MAP (	x1	=> y_ball_current,
												y1	=> led3_racket2,
												x2 => x_ball_current,
												y2 => "1110",												
												eq => right_colision3);
-----------------------------------------------------------------------------
comparator_goal1: ENTITY work.comparator3
								GENERIC MAP (	MAX_WIDTH	=>	4)
								PORT MAP (	x_b	=> x_ball_current,
												y_b	=> y_ball_current,
												x_r	=> "1111",
												LED1 	=> led1_racket2,
												LED2 	=> led2_racket2,
												LED3 	=> led3_racket2,
												eq    => goal_player1_s);
-------------------------------------------------------------------------------
comparator_goal2: ENTITY work.comparator3
								GENERIC MAP (	MAX_WIDTH	=>	4)
								PORT MAP (	x_b	=> x_ball_current,
												y_b	=> y_ball_current,
												x_r	=> "0000",
												LED1 	=> led1_racket1,
												LED2 	=> led2_racket1,
												LED3 	=> led3_racket1,
												eq    => goal_player2_s);

---------------------------------------------------------------------------------
counter_ball_x:ENTITY work.univ_bin_counter_ball
		GENERIC MAP(N => 4)
		PORT MAP(
					clk		=> clk_bola,
					rst		=> rst,
					ena		=> ena_x,
					syn_clr	=> syn_clr_x,
					up			=> up_x,
					d			=> d_x,
					p			=> p_x,
					max_tick => limit_x1,
					min_tick => limit_x2,
					counter	=>	x_ball_current);
--------------------------------------------------------------------------------
counter_ball_y:ENTITY work.univ_bin_counter_ball
		GENERIC MAP(N => 4)
		PORT MAP(
					clk		=> clk_bola,
					rst		=> rst,
					ena		=> ena_y,
					syn_clr	=> syn_clr_y,
					up			=> up_y,
					d			=> d_y,
					p			=> p_y,
					max_tick => limit_y,
					counter	=>	y_ball_current);
					
---------------------------------------------------------------------------

CLOCK:ENTITY work.univ_bin_counter
		GENERIC MAP(N => 24)
		PORT MAP(
					clk		=> clk,
					rst		=> rst,
					ena		=> ena,
					syn_clr	=> '0',
					load		=> '0',
					up			=> '1',
					d			=> vel_ball_s,
					max_tick	=>	clk_bola);
					
					
PROCESS (rst, clk)
BEGIN
	IF (rst = '1') THEN
		pr_state <= initial1;
	ELSIF (rising_edge(clk)) THEN
		pr_state <= nx_state;
	END IF;
END PROCESS;



PROCESS(limit_x1, limit_x2, limit_y, right_colision1, right_colision2, right_colision3, left_colision1, left_colision2, left_colision3, 
		  goal_player1_s, goal_player2_s, pr_state)
BEGIN
	CASE pr_state IS
		WHEN initial1 =>
			up_x <= '1';
			up_y <= '0';
			ena_x <= '1';
			ena_y <= '0';
			d_x <= "1111";
			d_y <= "0000";
			p_x <= "0111";
			p_y <="0011";
			syn_clr_x<='0';
			syn_clr_y<='0';
			IF ( right_colision1 = '1') THEN
				nx_state <= left_up;
			ELSIF(right_colision2 = '1') THEN
				nx_state <= left_x;
			ELSIF(right_colision3 = '1') THEN
				nx_state <= left_down;
			ELSIF(goal_player1_s = '1') THEN
				nx_state <= goal1;
			ELSE
				nx_state <= initial1;
			END IF;
----------------------------------------------------------------------------------------------------------	
		WHEN initial2 =>
			up_x <= '0';
			up_y <= '0';
			ena_x <= '1';
			ena_y <= '0';
			d_x <= "0000";
			d_y <= "0000";
			p_x <= "0111";
			p_y <="0011";
			syn_clr_x<='0';
			syn_clr_y<='0';
			IF (left_colision1 = '1') THEN
				nx_state <= right_up;
			ELSIF(left_colision2 = '1') THEN
				nx_state <= right_x;
			ELSIF(left_colision3 = '1') THEN
				nx_state <= right_down;
			ELSIF(goal_player2_s = '1') THEN
				nx_state <= goal2;
			ELSE
				nx_state <= initial2;
			END IF;
------------------derecha	
		WHEN right_x =>
			up_x <= '1';
			up_y <= '0';
			ena_x <= '1';
			ena_y <= '0';
			d_x <= "1111";
			d_y <= "0000";
			p_x <= x_ball_current;
			p_y <= y_ball_current;
			syn_clr_x<='0';
			syn_clr_y<='0';
			IF (right_colision1 = '1') THEN
				nx_state <= left_up;
			ELSIF(right_colision2 = '1') THEN
				nx_state <= left_x;
			ELSIF(right_colision3 = '1') THEN
				nx_state <= left_down;
			ELSIF(goal_player1_s = '1') THEN
				nx_state <= goal1;
			ELSE
				nx_state <= right_x;
			END IF;
------------------izquierda
		WHEN left_x =>
			up_x <= '0';
			up_y <= '0';
			ena_x <= '1';
			ena_y <= '0';
			d_x <= "0000";
			d_y <= "0000";
			p_x <= x_ball_current;
			p_y <= y_ball_current;
			syn_clr_x<='0';
			syn_clr_y<='0';
			IF (left_colision1 = '1') THEN
				nx_state <= right_up;
			ELSIF(left_colision2 = '1') THEN
				nx_state <= right_x;
			ELSIF(left_colision3 = '1') THEN
				nx_state <= right_down;
			ELSIF(goal_player2_s = '1') THEN
				nx_state <= goal2;
			ELSE
				nx_state <= left_x;
			END IF;
----------------------izquierda arriba
		WHEN left_up =>
			up_x <= '0';
			up_y <= '0';
			ena_x <= '1';
			ena_y <= '1';
			d_x <= "0000";
			d_y <= "0000";
			p_x <= x_ball_current;
			p_y <= y_ball_current;
			syn_clr_x<='0';
			syn_clr_y<='0';
			IF (limit_y = '1' AND top_colision ='1') THEN
				nx_state <= left_down;
			ELSIF (left_colision1 ='1') THEN
				nx_state <= right_up;
			ELSIF (left_colision2 ='1') THEN
				nx_state <= right_x;
			ELSIF (left_colision3 ='1') THEN
				nx_state <= right_down;
			ELSIF (goal_player2_s = '1') THEN
				nx_state <= goal2;
			ELSE
				nx_state <= left_up;
			END IF;
	
---------------------------izquierda abajo 

		WHEN left_down =>
			up_x <= '0';
			up_y <= '1';
			ena_x <= '1';
			ena_y <= '1';
			d_x <= "0000";
			d_y <= "0111";
			p_x <= x_ball_current;
			p_y <= y_ball_current;
			syn_clr_x<='0';
			syn_clr_y<='0';
			IF (limit_y = '1' AND bottom_colision ='1') THEN
				nx_state <= left_up;
			ELSIF (left_colision1 ='1') THEN
				nx_state <= right_up;
			ELSIF (left_colision2 ='1') THEN
				nx_state <= right_x;
			ELSIF (left_colision3 ='1') THEN
				nx_state <= right_down;
			ELSIF (goal_player2_s = '1') THEN
				nx_state <= goal2;
			ELSE
				nx_state <= left_down;
			END IF;

------------------------------derecha arriba

		WHEN right_up =>
			up_x <= '1';
			up_y <= '0';
			ena_x <= '1';
			ena_y <= '1';
			d_x <= "1111";
			d_y <= "0000";
			p_x <= x_ball_current;
			p_y <= y_ball_current;
			syn_clr_x<='0';
			syn_clr_y<='0';
			IF (limit_y = '1' AND top_colision ='1') THEN
				nx_state <= right_down;
			ELSIF (right_colision1 ='1') THEN
				nx_state <= left_up;
			ELSIF (right_colision2 ='1') THEN
				nx_state <= left_x;
			ELSIF (right_colision3 ='1') THEN
				nx_state <= left_down;
			ELSIF (goal_player1_s = '1') THEN
				nx_state <= goal1;
			ELSE
				nx_state <= right_up;
			END IF;
			
------------------------------derecha abajo

		WHEN right_down =>
			up_x <= '1';
			up_y <= '1';
			ena_x <= '1';
			ena_y <= '1';
			d_x <= "1111";
			d_y <= "0111";
			p_x <= x_ball_current;
			p_y <= y_ball_current;
			syn_clr_x<='0';
			syn_clr_y<='0';
			IF (limit_y = '1' AND bottom_colision ='1') THEN
				nx_state <= right_up;
			ELSIF (right_colision1 ='1') THEN
				nx_state <= right_up;
			ELSIF ( right_colision2 ='1') THEN
				nx_state <= right_x;
			ELSIF (right_colision3 ='1') THEN
				nx_state <= right_down;
			ELSIF (goal_player1_s = '1') THEN
				nx_state <=goal1;
			ELSE
				nx_state <= right_down;
			END IF;
			
		WHEN goal1 =>

			ena_x <= '1';
			ena_y <= '1';
			syn_clr_x<='1';
			syn_clr_y<='1';
			d_x <= "1111";
			d_y <= "0000";
			p_x <= "0111";
			p_y <="0011";
			nx_state <= initial1;
			
		WHEN goal2 =>

			ena_x <= '1';
			ena_y <= '1';
			syn_clr_x<='1';
			syn_clr_y<='1';
			d_x <= "0000";
			d_y <= "0000";
			p_x <= "0111";
			p_y <="0011";
			nx_state <= initial2;

			
			
		END CASE;
	END PROCESS;
END ARCHITECTURE;