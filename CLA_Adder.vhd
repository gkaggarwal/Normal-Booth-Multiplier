----------------------------------------------------------------------------------
-- Create Date:    15:31:19 04/14/2021 
-- Designer Name:  Gaurav Kumar 
-- Module Name:    CLA_Adder - Behavioral 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CLA_Adder is
    Generic (K: integer:=16 );
    Port ( A : in  STD_LOGIC_VECTOR(K-1 downto 0);
           B : in  STD_LOGIC_VECTOR(K-1 downto 0);
			  Cin: in STD_LOGIC:='0';
           sum_output : out  STD_LOGIC_VECTOR(K-1 downto 0);
           carry_output : out  STD_LOGIC);
end CLA_Adder;

architecture Behavioral of CLA_Adder is

------>>>>>>>>>>Signal And Enitity Declaration For 1 bit Full Adder---->>>>>>>>>>
Component Adder_1bit is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Cin : in  STD_LOGIC;
           Sum : out  STD_LOGIC;
           Carry : out  STD_LOGIC);
end Component;
signal sum,C: STD_LOGIC_VECTOR(K-1 downto 0);
signal carry: STD_LOGIC;
------>>>>>>>>>>Signal And Enitity Declaration For Carry Generator---->>>>>>>>>>
Component Carry_Generator is
    Generic(K: integer);
    Port ( A : in  STD_LOGIC_Vector(K-1 downto 0);
           B : in  STD_LOGIC_Vector(K-1 downto 0);
			  Cin : in STD_LOGIC;
           C_out : out  STD_LOGIC_vector(16 downto 1));
end Component;
signal C_out: STD_LOGIC_VECTOR(16 downto 1);

------>>>>>>>>>>-------------------------------------------------------<<<<<<<<<<

begin
CG0: Carry_Generator generic map (K=>K) port map(A=>A,B=>B,Cin=>Cin,C_out=>C_out);
 				
ADD: Adder_1bit port map(A=>A(0),B=>B(0),Cin=>Cin,Sum=>sum(0),Carry=>C(0));
Generate_Adder :
          For I in 1 to K-1 Generate
			 ADD: Adder_1bit port map(A=>A(I),B=>B(I),Cin=>C_out(I),Sum=>sum(I),Carry=>C(I));
			 end Generate Generate_Adder;
carry_output<= C(K-1);
sum_output<= sum;
  
end Behavioral;

