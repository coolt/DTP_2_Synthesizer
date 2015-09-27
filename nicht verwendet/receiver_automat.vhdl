LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY receiver_automat IS
	port (
		CLK : in std_logic;
		SI : in std_logic;
		active : out std_logic;
		PO : out std_logic_vector(3 downto 0)
	);
END receiver_automat;

ARCHITECTURE behavior OF receiver_automat IS
	signal auto_reg : std_logic_vector(2 downto 0) := "000";
	signal next_auto_reg : std_logic_vector(2 downto 0) := "000";
	
BEGIN

	po <= next_out_reg;

	process begin
		case auto_reg is
			when "000" =>
				if SI='0' then
					next_auto_reg<="001";
					active<='1';
				else
					next_auto_reg<="000";
					active<='0';
				end if;
			when "001" =>
				next_auto_reg<="010";
			when "010" =>
				next_auto_reg<="011";
			when "011" =>
				next_auto_reg<="100";
			when "100" =>
				next_auto_reg<="000";
				active<='0';
			when others =>
				next_auto_reg<="000";
		end case;
	end process;
	
	
	next_out_reg <= out_reg;
	
	process begin
		case auto_reg is
			when "001" =>
				next_out_reg(3) <= si;
			when "010" =>
			next_out_reg(2) <= si;
			when "011" =>
			next_out_reg(1) <= si;
			when "100" =>
			next_out_reg(0) <= si;
			when others => NULL;
		end case;
	end process;


	reg_ser_par: process begin
	IF reset_n = '0' THEN
		out_reg <= (others => '0');
		auto_reg <= (others => '0');
	ELSIF CLK'event and CLK='1' THEN -- with one wait event auto_regment
		out_reg <= next_out_reg;
		auto_reg <= next_auto_reg;
	END IF;
END;