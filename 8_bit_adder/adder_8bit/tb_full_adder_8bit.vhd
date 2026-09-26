
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder_8bit_tb is
end full_adder_8bit_tb;


architecture Behavior of full_adder_8bit_tb is

    component full_adder_8bit
        Port ( a    : in  STD_LOGIC_VECTOR(7 downto 0);
               b    : in  STD_LOGIC_VECTOR(7 downto 0);
               cin  : in  STD_LOGIC;
               sum  : out STD_LOGIC_VECTOR(7 downto 0);
               cout : out STD_LOGIC);
    end component;
	 
	 
	 signal a, b     : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal cin      : STD_LOGIC := '0';
    signal sum      : STD_LOGIC_VECTOR(7 downto 0);
    signal cout     : STD_LOGIC;

begin

    uut: full_adder_8bit
        port map (
            a    => a,
            b    => b,
            cin  => cin,
            sum  => sum,
            cout => cout
        );

    stim_proc: process
    begin
        a <= "00000101"; b <= "00000011"; cin <= '0'; wait for 50 ns;
        a <= "00001111"; b <= "11110000"; cin <= '0'; wait for 50 ns;
        a <= "11111111"; b <= "00000001"; cin <= '0'; wait for 50 ns;
        a <= "00000101"; b <= "00000011"; cin <= '1'; wait for 50 ns;

        wait;
    end process;
	 
	 
end Behavior;








