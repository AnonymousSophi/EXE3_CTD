library ieee;
use ieee.std_logic_1164.all;

entity FSM_Conta is 
port(clock: in std_logic;
     reset: in std_logic;
     contagem: out std_logic_vector(3 downto 0)
     );
end FSM_Conta;

architecture bhv of FSM_Conta is

type STATES is (E0, E9, E4, EB, EC, E6, E1, EF);
signal EA, PE: STATES;

begin

    P1: process(clock, reset)
        begin
         if reset= '0' then
            EA <= E0;
         elsif clock'event and clock= '0' then
            EA <= PE;
         end if;
        end process;
    
------------ SEQUÊNCIA 0 -> 0, 9, 4, B, C, 6, 1, F, 0... ------------
    
    P2: process(EA)
        begin
         case EA is
         
         when E0 =>
             contagem <= "0000" ; -- 0
             PE <= E9;
         when E9 =>
             contagem <= "1001" ; -- 9
             PE <= E4;
         when E4 =>
             contagem <= "0100"; -- 4
             PE <= EB;
         when EB =>
             contagem <= "1011"; -- B
             PE <= EC;
         when EC =>
             contagem <= "1100"; -- C
             PE <= E6;
         when E6 =>
             contagem <= "0110"; -- 6
             PE <= E1;
         when E1 =>
             contagem <= "0001"; -- 1
             PE <= EF;   
         when EF =>
             contagem <= "1111"; -- F
             PE <= E0;
             
         end case;
        end process;
end bhv;
