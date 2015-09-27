---------------------
---- D Flip Flop ----
---------------------
LIBRARY IEEE;
USE ieee.std_logic_1164.all;

Entity dff IS
	Port(
		resetn,D,clock :in std_logic;
		Q1,Q2 : out std_logic
	);
End dff;

ARCHITECTURE behavior OF dff IS
BEGIN
	p1: PROCESS (resetn,D,Clock)
	BEGIN
		IF resetn = '0' then
			Q1<='0';
			Q2<='1';
		ELSIF Clock'EVENT AND Clock = '1' THEN
			Q1 <= D;
			Q2 <= NOT D;
		END IF;
	END PROCESS p1;
END behavior;
