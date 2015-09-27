library ieee ;
use ieee.std_logic_1164.all;

entity bcd_7seg_alex is
	port(
		--clk : in std_logic;
		bcd_in1 : in std_logic_vector(3 downto 0);
		bcd_in2 : in std_logic_vector(3 downto 0);
		bcd_in3 : in std_logic_vector(3 downto 0);
		bcd_in4 : in std_logic_vector(3 downto 0);
		signal_segments1 : out std_logic_vector(6 downto 0);
		signal_segments2 : out std_logic_vector(6 downto 0);
		signal_segments3 : out std_logic_vector(6 downto 0);
		signal_segments4 : out std_logic_vector(6 downto 0)
	);
end bcd_7seg_alex;													
												
architecture struct of bcd_7seg_alex is					

begin
	siebenseg_automat1: process(bcd_in1)begin
		case bcd_in1 is											
			when "0000" => 	
				signal_segments1 <= "1111110";
			when "0001" => 	
				signal_segments1 <= "0110000";
			when "0010" => 	
				signal_segments1 <= "1101101";
			when "0011" => 	
				signal_segments1 <= "1111001";
			when "0100" => 	
				signal_segments1 <= "0110011";
			when "0101" => 	
				signal_segments1 <= "1011011";
			when "0110" => 	
				signal_segments1 <= "1011111";
			when "0111" => 	
				signal_segments1 <= "1110000";
			when "1000" => 	
				signal_segments1 <= "1111111";
			when "1001" => 	
				signal_segments1 <= "1111011";
			when others => 	
				signal_segments1 <= "0000000";
		end case;
	end process siebenseg_automat1;
	
	siebenseg_automat2: process(bcd_in2)begin
		case bcd_in2 is											
			when "0000" => 	
				signal_segments2 <= "1111110";
			when "0001" => 	
				signal_segments2 <= "0110000";
			when "0010" => 	
				signal_segments2 <= "1101101";
			when "0011" => 	
				signal_segments2 <= "1111001";
			when "0100" => 	
				signal_segments2 <= "0110011";
			when "0101" => 	
				signal_segments2 <= "1011011";
			when "0110" => 	
				signal_segments2 <= "1011111";
			when "0111" => 	
				signal_segments2 <= "1110000";
			when "1000" => 	
				signal_segments2 <= "1111111";
			when "1001" => 	
				signal_segments2 <= "1111011";
			when others => 	
				signal_segments2 <= "0000000";
		end case;
	end process siebenseg_automat2;
	
		siebenseg_automat3: process(bcd_in3)begin
		case bcd_in3 is											
			when "0000" => 	
				signal_segments3 <= "1111110";
			when "0001" => 	
				signal_segments3 <= "0110000";
			when "0010" => 	
				signal_segments3 <= "1101101";
			when "0011" => 	
				signal_segments3 <= "1111001";
			when "0100" => 	
				signal_segments3 <= "0110011";
			when "0101" => 	
				signal_segments3 <= "1011011";
			when "0110" => 	
				signal_segments3 <= "1011111";
			when "0111" => 	
				signal_segments3 <= "1110000";
			when "1000" => 	
				signal_segments3 <= "1111111";
			when "1001" => 	
				signal_segments3 <= "1111011";
			when others => 	
				signal_segments3 <= "0000000";
		end case;
	end process siebenseg_automat3;
	
			siebenseg_automat4: process(bcd_in4)begin
		case bcd_in4 is											
			when "0000" => 	
				signal_segments4 <= "1111110";
			when "0001" => 	
				signal_segments4 <= "0110000";
			when "0010" => 	
				signal_segments4 <= "1101101";
			when "0011" => 	
				signal_segments4 <= "1111001";
			when "0100" => 	
				signal_segments4 <= "0110011";
			when "0101" => 	
				signal_segments4 <= "1011011";
			when "0110" => 	
				signal_segments4 <= "1011111";
			when "0111" => 	
				signal_segments4 <= "1110000";
			when "1000" => 	
				signal_segments4 <= "1111111";
			when "1001" => 	
				signal_segments4 <= "1111011";
			when others => 	
				signal_segments4 <= "0000000";
		end case;
	end process siebenseg_automat4;
end struct;												 