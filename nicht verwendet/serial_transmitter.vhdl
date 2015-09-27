LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY serial_transmitter IS
	port (
		CLK : in std_logic;
		start : in std_logic;
		SO : out std_logic;
		PI : in std_logic_vector(3 downto 0)
	);
END serial_transmitter;

ARCHITECTURE behavior OF serial_transmitter IS
	signal temp : std_logic_vector(3 downto 0);
	signal state : std_logic_vector(2 downto 0) := "000";
BEGIN
	process begin
		wait until CLK'event and CLK='1'; -- with one wait event statement
		case state is

			when "000" =>
				if start='1' then
					temp<=PI;
					state<="001";
				else
					SO<='1';
				end if;

			when "001" =>
				SO<='0';
				state<="010";

			when "010" =>
				SO<=temp(0);
				state<="011";

			when "011" =>
				SO<=temp(1);
				state<="100";

			when "100" =>
				SO<=temp(2);
				state<="101";

			when "101" =>
				SO<=temp(3);
				state<="110";

			when "110" =>
				SO<='1';
				state<="000";

			when others =>
				SO<='1';
				state<="000";

		end case;
	end process;
END;
