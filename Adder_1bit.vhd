----------------------------------------------------------------------------------
-- Create Date:    15:31:19 04/14/2021 
-- Designer Name:  Gaurav Kumar 
-- Module Name:    Adder_1bit - Behavioral 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Adder_1bit is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Cin : in  STD_LOGIC;
           Sum : out  STD_LOGIC;
           Carry : out  STD_LOGIC);
end Adder_1bit;

architecture Behavioral of Adder_1bit is

begin

Sum<= (A XOR B XOR Cin);
Carry<= ((A AND B) OR ( B AND Cin) OR (A AND Cin));

end Behavioral;

