library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity empfang is
	port (
		clk : 		in std_logic;
		si : 		in std_logic;
		reset_n :	in std_logic;
		act : 		out std_logic ;
		po : 		out std_logic_vector(3 downto 0)
	);
end empfang;

architecture behavior of empfang is
	signal shiftreg :			std_logic_vector(4 downto 0);
	signal next_shiftreg :		std_logic_vector(4 downto 0);
	signal q_edge :				std_logic;
	signal q4 :					std_logic;
	constant load :				std_logic_vector(4 downto 0) := "10000";
	signal shiftright :			std_logic;
	signal shiftleft :			std_logic;
	signal falling_edge_det : 	std_logic;
	signal sel :				std_logic_vector(1 downto 0);
	signal dsl :				std_logic;
	signal temp :				std_logic_vector(1 downto 0);
	
begin
	
	falling_edge_detector: process(clk,reset_n)
	begin
		if reset_n = '0' then
			q_edge <= '0';
		elsif clk'event and clk='1' then
			q_edge <= si;
		end if;
		falling_edge_det <= (not si) and q_edge;
		
	end process falling_edge_detector;
	
	
	receiver_logik: process(temp)
	begin
		case temp is
			when "00" => sel <= "01"; -- shift right
			when "01" => sel <= "00"; -- hold
			when "10" => sel <= "01"; -- shift right
			when others => sel <= "11"; -- load
		end case;
	end process receiver_logik;
	
	logik1: process(q4,si)
	begin
		if q4 = '1' and si = '0' then
			temp <= "11";
		else
			temp <= falling_edge_det & q4;
		end if;
	end process logik1;
	--temp <= falling_edge_det & q4;
	
	schiebe_register: process(sel,reset_n,clk)
	begin
	
		case sel is
			when "00" =>
				next_shiftreg(0) <= shiftreg(0);
				next_shiftreg(1) <= shiftreg(1);
				next_shiftreg(2) <= shiftreg(2);
				next_shiftreg(3) <= shiftreg(3);
				next_shiftreg(4) <= shiftreg(4);
				act <= '0';
				shiftright <= '0';
			when "01" =>
				next_shiftreg(0) <= si;
				next_shiftreg(1) <= shiftreg(0);
				next_shiftreg(2) <= shiftreg(1);
				next_shiftreg(3) <= shiftreg(2);
				next_shiftreg(4) <= shiftreg(3);
				act <= '1';
				if shiftreg(3) = '1' then
					act <= '0';
					shiftright <= '0';
				end if;
			when "10" =>
				next_shiftreg(0) <= shiftreg(1);
				next_shiftreg(1) <= shiftreg(2);
				next_shiftreg(2) <= shiftreg(3);
				next_shiftreg(3) <= shiftreg(4);
				next_shiftreg(4) <= dsl;
				act <= '1';
				shiftleft <= '1';
			when others =>
				next_shiftreg(0) <= load(4);
				next_shiftreg(1) <= load(3);
				next_shiftreg(2) <= load(2);
				next_shiftreg(3) <= load(1);
				next_shiftreg(4) <= load(0);
				act <= '0';		
				shiftright <= '0';
		end case;
		
		
		if reset_n = '0' then
			shiftreg <= (others => '1');
		elsif clk'event and clk='1' then
			shiftreg <= next_shiftreg;
	
		end if;
		
		q4 <= shiftreg(4);
		
end process schiebe_register;
	
	po <= next_shiftreg(3 downto 0);
	
end architecture behavior;