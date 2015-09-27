LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY shift_reg IS
	port (
		DSR : in std_logic;
		DSL : in std_logic;
		P0 : in std_logic;
		MR_n : in std_logic;
		CK : in std_logic;
		P1 : in std_logic;
		P2 : in std_logic;
		P3 : in std_logic;
		P4 : in std_logic;
		Q1 : out std_logic;
		Q2 : out std_logic;
		Q3 : out std_logic;
		Q4 : out std_logic;
		sel : in std_logic_vector(1 downto 0)
	);
END shift_reg;

ARCHITECTURE behavior OF shift_reg IS
	component dff IS
	port(
		resetn,D,clock :in std_logic;
		Q1,Q2 : out std_logic
	);
	end component;

	component mux4to1 is
	port (
		i0 : in std_logic;
		i1 : in std_logic;
		i2 : in std_logic;
		i3 : in std_logic;
		sel : in std_logic_vector(1 downto 0);
		bitout : out std_logic
	);
	end component;
	signal w1,w2 : std_logic:='0';

BEGIN
	inst11: mux4to1 port map (
		i0 => w1,
		i1 => DSR,
		i2 => w2,
		i3 => P0,
		sel => sel
	);
END;
