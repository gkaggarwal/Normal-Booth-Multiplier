----------------------------------------------------------------------------------
-- Create Date:    20:08:30 04/16/2021 
-- Designer Name:  Gaurav Kumar
-- Module Name:    Xored_Input - Behavioral 

----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Xored_Input is
 Generic ( K : integer);  
	 Port ( A : in  STD_LOGIC_VECTOR (K-1 downto 0);
           Z : out  STD_LOGIC_VECTOR (K-1 downto 0));
end Xored_Input;

architecture Behavioral of Xored_Input is
begin
PROCESS(A)
 BEGIN
 Xored:   for I in 0 to K-1 loop
              Z(I)<= (A(I) xor '1');
          end loop Xored;		 
END PROCESS;

end Behavioral;

