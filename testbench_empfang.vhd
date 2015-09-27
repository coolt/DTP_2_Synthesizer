library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity testbench_empfang is

end testbench_empfang;

architecture behavior of testbench_empfang is

	component empfang
		port (	clk :	in std_logic;
				reset_n : in std_logic;
				si	:	in std_logic;
				act : 	out std_logic;
				po	:	out std_logic_vector(3 downto 0));
	end component empfang;

	signal 		t_si	:	std_logic;
	signal		t_po	:	std_logic_vector(3 downto 0);
	signal		t_clk	:	std_logic;
	signal		t_reset_n : std_logic;
	signal		t_act   :	std_logic;
	constant	clk_halfp	: time := 20 ns;

begin
		dut: empfang
		port map(	si => t_si,
					po => t_po,
					clk => t_clk,
					act => t_act,
					reset_n => t_reset_n);

stimuli: process
begin
		wait for clk_halfp;
		t_si <= '1';
		wait for 8 * clk_halfp;
		t_si <= '1';
		wait for 2 * clk_halfp;
		t_si <= '1';
		wait for 2 * clk_halfp;
		t_si <= '1';
		wait for 2 * clk_halfp;
		t_si <= '0';			-- Beginn Zeichen "1010"
		wait for 2 * clk_halfp;
		t_si <= '1';
		wait for 2 * clk_halfp;
		t_si <= '0';
		wait for 2 * clk_halfp;
		t_si <= '1';
		wait for 2 * clk_halfp;
		t_si <= '0';			-- Ende Zeichen 1
		wait for 2 * clk_halfp;
		t_si <= '0';			-- Begin Zeichen 2 "1010"
		wait for 2 * clk_halfp;
		t_si <= '1';
		wait for 2 * clk_halfp;
		t_si <= '0';
		wait for 2 * clk_halfp;
		t_si <= '1';
		wait for 2 * clk_halfp;
		t_si <= '0';			-- Ende Zeichen 2
		wait for 2 * clk_halfp;
		t_si <= '0';			-- Beginn Zeichen 3 "1101"
		wait for 2 * clk_halfp;
		t_si <= '1';			
		wait for 2 * clk_halfp;
		t_si <= '1';			
		wait for 2 * clk_halfp;
		t_si <= '0';			
		wait for 2 * clk_halfp;
		t_si <= '1';			-- Ende Zeichen 3
		wait for 2 * clk_halfp;
		t_si <= '0';			-- Beginn Zeichen 4 "1011"
		wait for 2 * clk_halfp;
		t_si <= '1';			
		wait for 2 * clk_halfp;
		t_si <= '0';			
		wait for 2 * clk_halfp;
		t_si <= '1';			
		wait for 2 * clk_halfp;
		t_si <= '1';			-- Ende Zeichen 4
		wait for 2 * clk_halfp;
		t_si <= '1';		
		wait;
		--assert (t_po = "1010") report "Expected po is '1010' after setting command" severity error;	
end process stimuli;

clkgen: process
begin
	wait for clk_halfp;
	t_clk <= '0';
	wait for clk_halfp;
	t_clk <= '1';
end process clkgen;

reset_n: process
begin
	wait for 2*clk_halfp;
	t_reset_n <= '0';
	wait for 8 * clk_halfp;
	t_reset_n <= '1';
	wait;
end process reset_n;
end architecture behavior;
	