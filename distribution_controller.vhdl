library ieee;
use ieee.std_logic_1164.all;

entity distribution_controller is
	port (
		active :	in std_logic;
		clock :		in std_logic;
		input :		in std_logic_vector(3 downto 0);
		out0 :		out std_logic_vector(3 downto 0);
		out1 :		out std_logic_vector(3 downto 0);
		out2 :		out std_logic_vector(3 downto 0);
		out3 :		out std_logic_vector(3 downto 0)
	);
end distribution_controller;

architecture behavior of distribution_controller is
	signal current_address :	std_logic_vector(1 downto 0) := "00";
	signal next_address :		std_logic_vector(1 downto 0) := "00";
	signal next_value :			std_logic_vector(3 downto 0);
	signal edge_detector_buffer,falling_edge,falling_edge_buffer,already_fallen,next_already_fallen : std_logic := '0';

begin
	which_edge: process(falling_edge,already_fallen,next_already_fallen) begin
		if falling_edge'event and already_fallen='0' then
			next_already_fallen<='1';
		elsif falling_edge'event and already_fallen='1' then
			next_already_fallen<='0';
		end if;
	end process which_edge;
	
	edge_counter: process(clock,already_fallen,next_already_fallen) begin
		if clock'event then
			already_fallen<=next_already_fallen;
		end if;
	end process edge_counter;

	edge_detector : process(active,clock) begin
		-- When a falling edge on the status line of the sender occurs
		-- this procedure will be executed and will trigger an action
		-- within the main process
		if clock'event then
			edge_detector_buffer<=active;
		end if;
		falling_edge <= (not active) and edge_detector_buffer; -- Here the falling edge gets propagated
	end process edge_detector;
	
	counter : process(already_fallen,falling_edge) begin
		if falling_edge'event and already_fallen='1' then
			current_address<=next_address;
		end if;
	end process counter;
	
	state_machine : process(current_address,next_address,falling_edge) begin
		case current_address is
			when "00" =>
				 next_address <= "01";
			when "01" =>
			      next_address <= "10";
			when "10" =>
			      next_address <= "11";
			when "11" =>
				next_address <= "00";
			when others => null;
		end case;
	end process state_machine;
	
	read_cycle : process(falling_edge,input) begin
		if falling_edge='1' then -- Data is ready: Storing it into a buffer
			next_value<=input;
		end if;
	end process read_cycle;

	distribution_control : process(already_fallen,falling_edge) begin
		if falling_edge'event and already_fallen='1' then
			case current_address is
				when "00" =>
					out0 <= next_value;
				when "01" =>
					out1 <= next_value;
				when "10" =>
					out2 <= next_value;
				when "11" =>
					out3 <= next_value;
				when others =>
					null;
			end case;
		end if;
	end process distribution_control;
end;
