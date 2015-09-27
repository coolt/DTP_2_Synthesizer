library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top_level is
	port (
		clk : 			in std_logic;
		dataIn : 		in std_logic;
		reset_n :		in std_logic;
		out_segment1 : 	out std_logic_vector(6 downto 0);
		out_segment2 : 	out std_logic_vector(6 downto 0);
		out_segment3 : 	out std_logic_vector(6 downto 0);
		out_segment4 : 	out std_logic_vector(6 downto 0)
	);
end top_level;

architecture behavior of top_level is

	component empfang
		port (
		clk : 		in std_logic;
		si : 		in std_logic;
		reset_n :	in std_logic;
		act : 		out std_logic ;
		po : 		out std_logic_vector(3 downto 0)
		);
	end component;
	
	component distribution_controller
		port(
		active :	in std_logic;
		clock :		in std_logic;
		input :		in std_logic_vector(3 downto 0);
		out0 :		out std_logic_vector(3 downto 0);
		out1 :		out std_logic_vector(3 downto 0);
		out2 :		out std_logic_vector(3 downto 0);
		out3 :		out std_logic_vector(3 downto 0)
		);
	end component;
	
	component bcd_7seg_alex
		port(
		bcd_in1 : in std_logic_vector(3 downto 0);
		bcd_in2 : in std_logic_vector(3 downto 0);
		bcd_in3 : in std_logic_vector(3 downto 0);
		bcd_in4 : in std_logic_vector(3 downto 0);
		signal_segments1 : out std_logic_vector(6 downto 0);
		signal_segments2 : out std_logic_vector(6 downto 0);
		signal_segments3 : out std_logic_vector(6 downto 0);
		signal_segments4 : out std_logic_vector(6 downto 0)
		);
	end  component;	

	signal schiebe :	std_logic; -- active. Signal zw. empfang und distribution_controller
	signal po_Data :	std_logic_vector(3 downto 0); -- Signal zw. empfang und distribution_controller
	signal bcd1,bcd2,bcd3,bcd4 : std_logic_vector(3 downto 0);-- Signale zw. distribution_controller und bcd_7seg
	
begin 

	instance1: empfang
		port map( 	clk => clk,
					si => dataIn,
					reset_n => reset_n,
					act => schiebe,
					po => po_Data);
	
	instance2: distribution_controller
		port map(	active => schiebe,
					clock => clk,
					input => po_Data,
					out0 => bcd1,
					out1 => bcd2,
					out2 => bcd3,
					out3 => bcd4);
					
	instance3: bcd_7seg_alex
		port map(	bcd_in1 => bcd1,
					bcd_in2 => bcd2,
					bcd_in3 => bcd3,
					bcd_in4 => bcd4,
					signal_segments1 => out_segment1,
					signal_segments2 => out_segment2,
					signal_segments3 => out_segment3,
					signal_segments4 => out_segment4);

end architecture behavior;