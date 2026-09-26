library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- 1-bit full adder (age-r ta)
entity full_adder is
    Port ( a    : in  STD_LOGIC;
           b    : in  STD_LOGIC;
           cin  : in  STD_LOGIC;
           sum  : out STD_LOGIC;
           cout : out STD_LOGIC);
end full_adder;

architecture Dataflow of full_adder is
begin
    sum  <= a xor b xor cin;
    cout <= (a and b) or (b and cin) or (a and cin);
end Dataflow;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder_8bit is
    Port ( a    : in  STD_LOGIC_VECTOR(7 downto 0);
           b    : in  STD_LOGIC_VECTOR(7 downto 0);
           cin  : in  STD_LOGIC;
           sum  : out STD_LOGIC_VECTOR(7 downto 0);
           cout : out STD_LOGIC);
end full_adder_8bit;

architecture Structural of full_adder_8bit is

    component full_adder
        Port ( a    : in  STD_LOGIC;
               b    : in  STD_LOGIC;
               cin  : in  STD_LOGIC;
               sum  : out STD_LOGIC;
               cout : out STD_LOGIC);
    end component;

    signal carry : STD_LOGIC_VECTOR(8 downto 0);

begin
    carry(0) <= cin;

    FA0: full_adder port map ( a => a(0), b => b(0), cin => carry(0), sum => sum(0), cout => carry(1) );
    FA1: full_adder port map ( a => a(1), b => b(1), cin => carry(1), sum => sum(1), cout => carry(2) );
    FA2: full_adder port map ( a => a(2), b => b(2), cin => carry(2), sum => sum(2), cout => carry(3) );
    FA3: full_adder port map ( a => a(3), b => b(3), cin => carry(3), sum => sum(3), cout => carry(4) );
    FA4: full_adder port map ( a => a(4), b => b(4), cin => carry(4), sum => sum(4), cout => carry(5) );
    FA5: full_adder port map ( a => a(5), b => b(5), cin => carry(5), sum => sum(5), cout => carry(6) );
    FA6: full_adder port map ( a => a(6), b => b(6), cin => carry(6), sum => sum(6), cout => carry(7) );
    FA7: full_adder port map ( a => a(7), b => b(7), cin => carry(7), sum => sum(7), cout => carry(8) );

    cout <= carry(8);

end Structural;
