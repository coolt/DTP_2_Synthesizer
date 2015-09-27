library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity testbench_top_level is

end testbench_top_level;

architecture behavior of testbench_top_level is

	component top_level
		port( 	clk : 			in std_logic;
				dataIn : 		in std_logic;
				reset_n :		in std_logic;
				out_segment1 : 	out std_logic_vector(6 downto 0);
				out_segment2 : 	out std_logic_vector(6 downto 0);
				out_segment3 : 	out std_logic_vector(6 downto 0);
				out_segment4 : 	out std_logic_vector(6 downto 0)
		);	
	end component top_level;

	signal 		t_dataIn :			std_logic;
	signal		t_out_segment1 :	std_logic_vector(6 downto 0);
	signal		t_out_segment2 :	std_logic_vector(6 downto 0);
	signal		t_out_segment3 :	std_logic_vector(6 downto 0);
	signal		t_out_segment4 :	std_logic_vector(6 downto 0);		
	signal		t_clk :				std_logic;
	signal		t_reset_n : 		std_logic;
	constant	clk_halfp : 		time := 20 ns;
	
begin
		dut: top_level
		port map(	dataIn => t_dataIn,
					clk => t_clk,
					reset_n => t_reset_n,
					out_segment1 => t_out_segment1,
					out_segment2 => t_out_segment2,
					out_segment3 => t_out_segment3,
					out_segment4 => t_out_segment4);

stimuli: process
begin
		wait for clk_halfp;
		t_dataIn <= '1';
		wait for 8 * clk_halfp;
		t_dataIn <= '1';
		wait for 2 * clk_halfp;
		t_dataIn <= '1';
		wait for 2 * clk_halfp;
		t_dataIn <= '1';
		wait for 2 * clk_halfp;
		t_dataIn <= '0';			-- Beginn Zeichen "1010" Zahl 10
		wait for 2 * clk_halfp;
		t_dataIn <= '1';
		wait for 2 * clk_halfp;
		t_dataIn <= '0';
		wait for 2 * clk_halfp;
		t_dataIn <= '1';
		wait for 2 * clk_halfp;
		t_dataIn <= '0';			-- Ende Zeichen 1
		wait for 2 * clk_halfp;
		t_dataIn <= '0';			-- Begin Zeichen 2 "1000" Zahl 8
		wait for 2 * clk_halfp;
		assert (t_out_segment1 = "0000000") report "Erwartete BCD-Code ist 0000000." severity error;
		t_dataIn <= '1';
		wait for 2 * clk_halfp;
		t_dataIn <= '0';
		wait for 2 * clk_halfp;
		t_dataIn <= '0';
		wait for 2 * clk_halfp;
		t_dataIn <= '0';			-- Ende Zeichen 2
		wait for 2 * clk_halfp;
		t_dataIn <= '0';			-- Beginn Zeichen 3 "0101" Zahl 5
		wait for 2 * clk_halfp;
		assert (t_out_segment2 = "1111111") report "Erwartete BCD-Code ist 1111111." severity error;
		t_dataIn <= '0';			
		wait for 2 * clk_halfp;
		t_dataIn <= '1';			
		wait for 2 * clk_halfp;
		t_dataIn <= '0';			
		wait for 2 * clk_halfp;
		t_dataIn <= '1';			-- Ende Zeichen 3
		wait for 2 * clk_halfp;
		t_dataIn <= '0';			-- Beginn Zeichen 4 "1001" Zahl 9
		wait for 2 * clk_halfp;
		assert (t_out_segment3 = "1011011") report "Erwartete BCD-Code ist 1011011." severity error;
		t_dataIn <= '1';			
		wait for 2 * clk_halfp;
		t_dataIn <= '0';			
		wait for 2 * clk_halfp;
		t_dataIn <= '0';			
		wait for 2 * clk_halfp;
		t_dataIn <= '1';			-- Ende Zeichen 4
		wait for 2 * clk_halfp;
		t_dataIn <= '1';	
		wait for 400 ns;
		assert (t_out_segment4 = "1111011") report "Erwartete BCD-Code ist 1111011." severity error;
		assert false report "Die ersten 4 Zeichen wurden erfolgreich uebermittelt" severity note;
		t_dataIn <= '0';			-- Beginn Zeichen 5 "0110" Zahl 6
		wait for 2 * clk_halfp;
		t_dataIn <= '0';
		wait for 2 * clk_halfp;
		t_dataIn <= '1';
		wait for 2 * clk_halfp;
		t_dataIn <= '1';
		wait for 2 * clk_halfp;
		t_dataIn <= '0';			-- Ende Zeichen 5
		wait for 2 * clk_halfp;
		t_dataIn <= '0';			-- Begin Zeichen 6 "0011" Zahl 3
		wait for 2 * clk_halfp;
		assert (t_out_segment1 = "1011111") report "Erwartete BCD-Code ist 1011111." severity error;
		t_dataIn <= '0';
		wait for 2 * clk_halfp;
		t_dataIn <= '0';
		wait for 2 * clk_halfp;
		t_dataIn <= '1';
		wait for 2 * clk_halfp;
		t_dataIn <= '1';			-- Ende Zeichen 6
		wait for 2 * clk_halfp;
		t_dataIn <= '0';			-- Beginn Zeichen 7 "0010" Zahl 2
		wait for 2 * clk_halfp;
		assert (t_out_segment2 = "1111001") report "Erwartete BCD-Code ist 1111001." severity error;
		t_dataIn <= '0';			
		wait for 2 * clk_halfp;
		t_dataIn <= '0';			
		wait for 2 * clk_halfp;
		t_dataIn <= '1';			
		wait for 2 * clk_halfp;
		t_dataIn <= '0';			-- Ende Zeichen 7
		wait for 2 * clk_halfp;
		t_dataIn <= '0';			-- Beginn Zeichen 8 "0001" Zahl 1
		wait for 2 * clk_halfp;
		assert (t_out_segment3 = "1101101") report "Erwartete BCD-Code ist 1101101." severity error;
		t_dataIn <= '0';			
		wait for 2 * clk_halfp;
		t_dataIn <= '0';			
		wait for 2 * clk_halfp;
		t_dataIn <= '0';			
		wait for 2 * clk_halfp;
		t_dataIn <= '1';			-- Ende Zeichen 8
		wait for 2 * clk_halfp;
		t_dataIn <= '1';
		wait for 2 * clk_halfp;
		assert (t_out_segment4 = "0110000") report "Erwartete BCD-Code ist 0110000." severity error;
		assert false report "Die zweiten 4 Zeichen wurden erfolgreich uebermittelt" severity note;
		assert false report "------ Alle Tests sind abgeschlossen ------" severity note;
		wait;
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
	wait for 1000 ns;
	t_reset_n <= '0';
	wait for 6 * clk_halfp;
	t_reset_n <= '1';
	wait;
end process reset_n;
end architecture behavior;
