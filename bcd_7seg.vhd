library ieee ;
use ieee.std_logic_1164.all;

entity bcd_7seg is
	port(
		clk : in std_logic;
		bcd_in : in std_logic_vector(3 downto 0);
		signal_segments : out std_logic_vector(6 downto 0)
	);
end bcd_7seg;													
												
architecture struct of bcd_7seg is					

begin
	siebenseg_automat: process(bcd_in)begin
		case bcd_in is											
			when "0000" => 	
				signal_segments <= "1111110";
			when "0001" => 	
				signal_segments <= "0110000";
			when "0010" => 	
				signal_segments <= "1101101";
			when "0011" => 	
				signal_segments <= "1111001";
			when "0100" => 	
				signal_segments <= "0110011";
			when "0101" => 	
				signal_segments <= "1011011";
			when "0110" => 	
				signal_segments <= "1011111";
			when "0111" => 	
				signal_segments <= "1110000";
			when "1000" => 	
				signal_segments <= "1111111";
			when "1001" => 	
				signal_segments <= "1111011";
			when others => 	
				signal_segments <= "0000000";
		end case;
	end process siebenseg_automat;
end struct;												 