library ieee ;
use ieee.std_logic_1164.all;

entity testbench_bcd_7seg	is
end testbench_bcd_7seg;											
												
architecture test of testbench_bcd_7seg is	
	component bcd_7seg 									
		port(
				clk					: in std_logic;
				bcd_in 				: in std_logic_vector(3 downto 0);
				signal_segments	: out std_logic_vector(6 downto 0)
		);
	end component;	

  signal  	t_clock: std_logic;
	signal  	t_bcd_in: std_logic_vector(3 downto 0);
	signal 	t_signal_segments :std_logic_vector(6 downto 0);
	constant clk_halfp : time := 20 ns;

begin	
	dut: bcd_7seg
	port map(
	  clk => t_clock,
		bcd_in => t_bcd_in,
		signal_segments => t_signal_segments	
	);		
		
  clock: process
  begin
    t_clock <= '1';
    wait for clk_halfp;
    t_clock <= '0';
    wait for clk_halfp;
  end process clock;
  
	stimuli: process
	begin										
		t_bcd_in <=  "0000";
		wait for 8 * clk_halfp;
		t_bcd_in <= "0001" ;
		wait for 8 * clk_halfp;
		t_bcd_in <= "0010" ;
		wait for 8 * clk_halfp;
		t_bcd_in <= "0011" ;
		wait for 8 * clk_halfp;
		t_bcd_in <= "0100" ;
		wait for 8 * clk_halfp;
		t_bcd_in <= "0101" ;
		wait for 8 * clk_halfp;
		t_bcd_in <= "0110" ;
		wait for 8 * clk_halfp;
		t_bcd_in <= "0111" ;
		wait for 8 * clk_halfp;
		t_bcd_in <= "1000" ;
		wait for 8 * clk_halfp;
		t_bcd_in <= "1001" ;	
		wait for 8 * clk_halfp;
	end process stimuli;
end test;												 