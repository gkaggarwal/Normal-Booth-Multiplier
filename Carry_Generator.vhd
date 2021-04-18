
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Carry_Generator is
    Generic(K: integer);
    Port ( A : in  STD_LOGIC_Vector(K-1 downto 0);
           B : in  STD_LOGIC_Vector(K-1 downto 0);
			  Cin : in STD_LOGIC;
           C_out : out  STD_LOGIC_vector(16 downto 1));
end Carry_Generator;

architecture Behavioral of Carry_Generator is
------>>>>>>>>>>Signal Declaration For Propogate and Generate Carry---->>>>>>>>>>

signal P,G: STD_LOGIC_VECTOR(K-1 downto 0);

------>>>>>>>>>>-------------------------------------------------------<<<<<<<<<<

begin
P<= A XOR B;
G<= A AND B;
C_out(1)<=  (G(0) OR (P(0) AND Cin));
C_out(2)<=  (G(1) OR (P(1) AND G(0)) OR (P(1) AND P(0) AND Cin)); 
C_out(3)<=  (G(2) OR (P(2) AND G(1)) OR (P(2) AND P(1) AND G(0)) OR 
            (P(2) AND P(1) AND P(0) AND Cin));
C_out(4)<=  (G(3) OR (P(3) AND G(2)) OR (P(3) AND P(2) AND G(1)) OR 
            (P(3) AND P(2) AND P(1) AND G(0)) OR (P(3) AND P(2) AND  P(1) AND P(0) AND Cin));
C_out(5)<=  (G(4) OR (P(4) and (G(3) OR (P(3) AND G(2)) OR (P(3) AND P(2) AND G(1)) OR 
            (P(3) AND P(2) AND P(1) AND G(0)) OR (P(3) AND P(2) AND P(1) AND P(0) AND Cin))));
C_out(6)<=  (G(5) OR (P(5) AND ( G(4) OR (P(4) and (G(3) OR (P(3) AND G(2)) OR (P(3) AND P(2) AND G(1)) OR 
            (P(3) AND P(2) AND P(1) AND G(0)) OR (P(3) AND P(2) AND P(1) AND P(0) AND Cin))))));
C_out(7)<=  (G(6) OR (P(6) AND (G(5) OR (P(5) AND ( G(4) OR (P(4) and (G(3) OR (P(3) AND G(2)) OR (P(3) AND P(2) AND G(1)) OR 
            (P(3) AND P(2) AND P(1) AND G(0)) OR (P(3) AND P(2) AND P(1) AND P(0) AND Cin))))))));
C_out(8)<=  (G(7) OR ( P(7) AND (G(6) OR (P(6) AND (G(5) OR (P(5) AND ( G(4) OR (P(4) and (G(3) OR (P(3) AND G(2)) OR (P(3) AND P(2) AND G(1)) OR 
            (P(3) AND P(2) AND P(1) AND G(0)) OR (P(3) AND P(2) AND P(1) AND P(0) AND Cin))))))))));
C_out(9)<=  (G(8) OR (P(8) AND (G(7) OR ( P(7) AND (G(6) OR (P(6) AND (G(5) OR (P(5) AND ( G(4) OR (P(4) and (G(3) OR (P(3) AND G(2)) OR (P(3) AND P(2) AND G(1)) OR 
            (P(3) AND P(2) AND P(1) AND G(0)) OR (P(3) AND P(2) AND P(1) AND P(0) AND Cin))))))))))));
C_out(10)<= (G(9) OR (P(9) AND (G(8) OR (P(8) AND (G(7) OR ( P(7) AND (G(6) OR (P(6) AND (G(5) OR (P(5) AND ( G(4) OR (P(4) and (G(3) OR (P(3) AND G(2)) OR (P(3) AND P(2) AND G(1)) OR 
            (P(3) AND P(2) AND P(1) AND G(0)) OR (P(3) AND P(2) AND P(1) AND P(0) AND Cin))))))))))))));
C_out(11)<= (G(10) OR (P(10) AND (G(9) OR (P(9) AND (G(8) OR (P(8) AND (G(7) OR ( P(7) AND (G(6) OR (P(6) AND (G(5) OR (P(5) AND ( G(4) OR (P(4) and (G(3) OR (P(3) AND G(2)) OR (P(3) AND P(2) AND G(1)) OR 
            (P(3) AND P(2) AND P(1) AND G(0)) OR (P(3) AND P(2) AND P(1) AND P(0) AND Cin))))))))))))))));
C_out(12)<= (G(11) OR (P(11) AND (G(10) OR (P(10) AND (G(9) OR (P(9) AND (G(8) OR (P(8) AND (G(7) OR ( P(7) AND (G(6) OR (P(6) AND (G(5) OR (P(5) AND ( G(4) OR (P(4) and (G(3) OR (P(3) AND G(2)) OR (P(3) AND P(2) AND G(1)) OR 
            (P(3) AND P(2) AND P(1) AND G(0)) OR (P(3) AND P(2) AND P(1) AND P(0) AND Cin))))))))))))))))));
C_out(13)<= (G(12) OR (P(12) AND (G(11) OR (P(11) AND (G(10) OR (P(10) AND (G(9) OR (P(9) AND (G(8) OR (P(8) AND (G(7) OR ( P(7) AND (G(6) OR (P(6) AND (G(5) OR (P(5) AND ( G(4) OR (P(4) and (G(3) OR (P(3) AND G(2)) OR (P(3) AND P(2) AND G(1)) OR 
            (P(3) AND P(2) AND P(1) AND G(0)) OR (P(3) AND P(2) AND P(1) AND P(0) AND Cin))))))))))))))))))));
C_out(14)<= (G(13) OR (P(13) AND (G(12) OR (P(12) AND (G(11) OR (P(11) AND (G(10) OR (P(10) AND (G(9) OR (P(9) AND (G(8) OR (P(8) AND (G(7) OR ( P(7) AND (G(6) OR (P(6) AND (G(5) OR (P(5) AND ( G(4) OR (P(4) and (G(3) OR (P(3) AND G(2)) OR (P(3) AND P(2) AND G(1)) OR 
            (P(3) AND P(2) AND P(1) AND G(0)) OR (P(3) AND P(2) AND P(1) AND P(0) AND Cin))))))))))))))))))))));
C_out(15)<= (G(14) OR (P(14) AND (G(13) OR (P(13) AND (G(12) OR (P(12) AND (G(11) OR (P(11) AND (G(10) OR (P(10) AND (G(9) OR (P(9) AND (G(8) OR (P(8) AND (G(7) OR ( P(7) AND (G(6) OR (P(6) AND (G(5) OR (P(5) AND ( G(4) OR (P(4) and (G(3) OR (P(3) AND G(2)) OR (P(3) AND P(2) AND G(1)) OR 
            (P(3) AND P(2) AND P(1) AND G(0)) OR (P(3) AND P(2) AND P(1) AND P(0) AND Cin))))))))))))))))))))))));
C_out(16)<= (G(15) OR (P(15) AND (G(14) OR (P(14) AND (G(13) OR (P(13) AND (G(12) OR (P(12) AND (G(11) OR (P(11) AND (G(10) OR (P(10) AND (G(9) OR (P(9) AND (G(8) OR (P(8) AND (G(7) OR ( P(7) AND (G(6) OR (P(6) AND (G(5) OR (P(5) AND ( G(4) OR (P(4) and (G(3) OR (P(3) AND G(2)) OR (P(3) AND P(2) AND G(1)) OR 
            (P(3) AND P(2) AND P(1) AND G(0)) OR (P(3) AND P(2) AND P(1) AND P(0) AND Cin))))))))))))))))))))))))));

end Behavioral;

