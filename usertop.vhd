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
signal N, S: std_logic_vector(3 downto 0); -- Sinais p/ entrada e saída do registrador
signal CLK_STEP: std_logic;

------------ COMPONENTES ------------

component FSM_Conta is 
port(clock: in std_logic;
     reset: in std_logic;
     contagem: out std_logic_vector(3 downto 0)
     );
end component;

component reg_4bits is 
port (CLK:   in  std_logic;
	  RST:   in  std_logic;
	  N:   in  std_logic_vector(3 downto 0);
      S: out std_logic_vector(3 downto 0)
      ); 
end component; 

component decod7seg is
port(C: in std_logic_vector(3 downto 0);
    HEX0: out std_logic_vector(6 downto 0)
    );
end component;


begin

CLK_STEP <= not KEY(1);

LEDR(3 downto 0) <= N;
LEDR(17 downto 4) <= (others => '0'); -- Desliga os outros LEDs que não estão em uso

HEX1 <= (others => '1'); -- Desliga os outros HEX que não estão em uso
HEX2 <= (others => '1'); 
HEX3 <= (others => '1');
HEX4 <= (others => '1'); 
HEX5 <= (others => '1'); 
HEX6 <= (others => '1'); 
HEX7 <= (others => '1');


FSM0: FSM_Conta port map (CLK_STEP, KEY(0), N); 
REG0: reg_4bits port map (CLK_STEP, KEY(0), N, S);
DEC0: decod7seg port map (S, HEX0);


end circuito_exe3;
