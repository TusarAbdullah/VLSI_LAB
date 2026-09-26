library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder_tb is
end full_adder_tb;

architecture Behavior of full_adder_tb is
    -- Component declaration for the Unit Under Test (UUT)
    component full_adder
        Port ( a    : in  STD_LOGIC;
               b    : in  STD_LOGIC;
               cin  : in  STD_LOGIC;
               sum  : out STD_LOGIC;
               cout : out STD_LOGIC);
    end component;

    -- Testbench signals
    signal a, b, cin   : STD_LOGIC := '0';
    signal sum, cout   : STD_LOGIC;

begin
    -- Instantiate the UUT
    uut: full_adder
        port map (
            a    => a,
            b    => b,
            cin  => cin,
            sum  => sum,
            cout => cout
        );

    -- Stimulus process
    stim_proc: process
    begin
	         -- Test all 8 combinations of a, b, cin
        a <= '0'; b <= '0'; cin <= '0'; wait for 20 ns;
        a <= '0'; b <= '0'; cin <= '1'; wait for 20 ns;
        a <= '0'; b <= '1'; cin <= '0'; wait for 20 ns;
		  a <= '0'; b <= '1'; cin <= '1'; wait for 20 ns;
        a <= '1'; b <= '0'; cin <= '0'; wait for 20 ns;
        a <= '1'; b <= '0'; cin <= '1'; wait for 20 ns;
        a <= '1'; b <= '1'; cin <= '0'; wait for 20 ns;
        a <= '1'; b <= '1'; cin <= '1'; wait for 20 ns;
		  
		  wait; -- process থামিয়ে দেয়, simulation শেষ
    end process;

end Behavior;
	 
	 
	 