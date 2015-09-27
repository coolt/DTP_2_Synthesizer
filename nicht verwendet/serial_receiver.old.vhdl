LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY serial_receiver IS
	port (
		CLK : in std_logic;
		SI : in std_logic;
		PO : out std_logic_vector(3 downto 0)
	);
END serial_receiver;

ARCHITECTURE behavior OF serial_receiver IS
	signal state : std_logic_vector(2 downto 0) := "000";
BEGIN
	process begin
		wait until CLK'event and CLK='1'; -- with one wait event statement
		case state is

			when "000" =>
				if SI='0' then
					state<="001";
				end if;

			when "001" =>
				PO(3)<=SI;
				state<="010";

			when "010" =>
				PO(2)<=SI;
				state<="011";

			when "011" =>
				PO(1)<=SI;
				state<="100";

			when "100" =>
				PO(0)<=SI;
				state<="000";

			when others =>
				state<="000";

		end case;
	end process;
END;
