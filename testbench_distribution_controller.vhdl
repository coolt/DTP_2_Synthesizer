LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity testbench_distribution_controller is

end testbench_distribution_controller;

architecture struct of testbench_distribution_controller is
	
	component distribution_controller
	port (
		active : in std_logic;
		clock : in std_logic;
		input : in std_logic_vector(3 downto 0);
		out0 : out std_logic_vector(3 downto 0);
		out1 : out std_logic_vector(3 downto 0);
		out2 : out std_logic_vector(3 downto 0);
		out3 : out std_logic_vector(3 downto 0)
	);
	end component;

	signal		t_active, t_clock	: std_logic := '1';
	signal 		t_output			: std_logic_vector(3 downto 0) := "0001";
	constant	clk_halfp		: time := 10 ns;

begin

	connections: distribution_controller
		port map(	active => t_active,
				clock => t_clock,
				input => t_output
			);

	clock: process begin
		t_clock<='0';
		wait for clk_halfp;
		t_clock<='1';
		wait for clk_halfp;
	end process clock;

	stimuli: process begin
		t_active <= '1';

		wait for 10*clk_halfp;

		t_output <= "0001";
		wait for 2*clk_halfp;
		t_active <= '0';
		wait for 2*clk_halfp;

		t_active <= '1';

		wait for 10*clk_halfp;

		t_output <= "0011";
		wait for 2*clk_halfp;
		t_active <= '0';
		wait for 2*clk_halfp;

		t_active <= '1';

		wait for 10*clk_halfp;

		t_output <= "0111";
		wait for 2*clk_halfp;
		t_active <= '0';
		wait for 2*clk_halfp;

		t_active <= '1';

		wait for 10*clk_halfp;

		t_output <= "1111";
		wait for 2*clk_halfp;
		t_active <= '0';
		wait for 2*clk_halfp;
		
		wait for 20*clk_halfp;

	end process stimuli;

end struct;