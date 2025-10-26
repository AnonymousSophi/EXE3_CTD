library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.std_logic_signed.all;

entity usertop is
port(CLOCK_50:in std_logic;
     --CLK_500Hz:in std_logic;
     --CLK_1Hz: in std_logic;
     KEY:in std_logic_vector(3 downto 0);
     SW:in std_logic_vector(17 downto 0);
     LEDR:out std_logic_vector(17 downto 0);
     HEX0,HEX1,HEX2,HEX3,HEX4,HEX5,HEX6,HEX7: out std_logic_vector(6 downto 0));
end usertop;


architecture circuito_exe3 of usertop is


component mux is 
port (sel: in std_logic_vector(1 downto 0);
	F1,F2,F3,F4: in std_logic_vector(3 downto 0);
	F: out std_logic_vector(3 downto 0)
    );
end component;

component Registrador is 
port (CLK:   in  std_logic;
	  RST:   in  std_logic;
	  Enter:   in  std_logic;
      Q: out std_logic_vector(3 downto 0)
      ); 
end component;

component somador is
port (X: in std_logic_vector(3 downto 0);
    Y: in std_logic_vector(3 downto 0);
    S: out std_logic_vector(4 downto 0)
    );
end component;

component decod7seg is
port(C: in std_logic_vector(3 downto 0);
    HEX0: out std_logic_vector(6 downto 0)
    );
end component;


begin



end circuito_exe3;
