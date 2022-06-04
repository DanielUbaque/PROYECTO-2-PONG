LIBRARY IEEE;
USE ieee.std_logic_1164.all;
USE std.standard.all;
-------------------------------------------------------------------------------------
ENTITY  score_game IS
	PORT(	clk				:	IN	STD_LOGIC;
			rst				:	IN	STD_LOGIC;
			ena				:	IN	STD_LOGIC;
			goal_player1	:	IN STD_LOGIC;
			goal_player2	:	IN STD_LOGIC;
			score1			:	OUT	STD_LOGIC_VECTOR(3 DOWNTO 0);
			score2			:	OUT	STD_LOGIC_VECTOR(3 DOWNTO 0);
			sseg1				:	OUT	STD_LOGIC_VECTOR(6 DOWNTO 0);
			sseg2				:	OUT	STD_LOGIC_VECTOR(6 DOWNTO 0);
			win1				:	OUT	STD_LOGIC;
			win2				:	OUT	STD_LOGIC

);
END ENTITY score_game;
--------------------------------------------------------------------------------------
ARCHITECTURE functional	OF score_game IS
	SIGNAL goal_player1_s   : STD_LOGIC;
	SIGNAL goal_player2_s   : STD_LOGIC;
	SIGNAL clk_score			: STD_LOGIC;
	SIGNAL score1_s		   	:	STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL score2_s			   :	STD_LOGIC_VECTOR(3 DOWNTO 0);
BEGIN

score1 <= score1_s;
score2 <= score2_s;

goal_player1_s <= goal_player1;
goal_player2_s <= goal_player2;

 score_1:ENTITY work.univ_bin_counter_ball
		GENERIC MAP(N => 4)
		PORT MAP(
					clk		=> clk_score,
					rst		=> rst,
					ena		=> goal_player1_s,
					syn_clr	=> '0',
					up			=> '1',
					d			=> "1001",
					p			=> "0000",
					max_tick => win1,
					counter	=>	score1_s);
					
 score_2:ENTITY work.univ_bin_counter_ball
		GENERIC MAP(N => 4)
		PORT MAP(
					clk		=> clk_score,
					rst		=> rst,
					ena		=> goal_player2_s,
					syn_clr	=> '0',
					up			=> '1',
					d			=> "1001",
					p			=> "0000",
					max_tick => win2,
					counter	=>	score2_s);
					
CLOCK_score:ENTITY work.univ_bin_counter
		GENERIC MAP(N => 24)
		PORT MAP(
					clk		=> clk,
					rst		=> rst,
					ena		=> ena,
					syn_clr	=> '0',
					load		=> '0',
					up			=> '1',
					d			=> "111001001110000111000000",
					max_tick	=>	clk_score);

score_player1: ENTITY work.bin_to_sseg
					PORT MAP (	bin1 => score1_s,
									sseg  => sseg1);
									
score_player2: ENTITY work.bin_to_sseg
					PORT MAP (	bin1 => score2_s,
									sseg  => sseg2);
END ARCHITECTURE;	