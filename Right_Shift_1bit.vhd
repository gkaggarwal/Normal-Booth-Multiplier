----------------------------------------------------------------------------------
-- Create Date:    19:48:13 04/16/2021 
-- Designer Name:  Gaurav Kumar 
-- Module Name:    Right_Shift_1bit - Behavioral 

----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Right_Shift_1bit is
 Generic ( K :integer);
    Port ( A : in  STD_LOGIC_VECTOR (K-1 downto 0);
           Z : out  STD_LOGIC_VECTOR (K-1 downto 0));
end Right_Shift_1bit;

architecture Behavioral of Right_Shift_1bit is

begin
Z(K-2 downto 0)<=A(K-1 downto 1);
Z(K-1)<='0';
end Behavioral;

