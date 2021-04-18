----------------------------------------------------------------------------------
-- Create Date:    11:15:14 04/16/2021 
-- Designer Name:  Gaurav Kumar
-- Module Name:    Booth_Controller - Behavioral 

----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Booth_Controller is
 Generic ( K: integer);
    Port ( CLK,RST,START: in STD_LOGIC;
	       control_signal: in STD_LOGIC_VECTOR(1 downto 0);
	       Shift,Done,Cin,Add,Xored_IN:out STD_LOGIC
			 );
end Booth_Controller;

architecture Behavioral of Booth_Controller is

TYPE state IS (S0,S1,S2,S3,S4,S5);
SIGNAL next_state : state;
SIGNAL count:INTEGER :=K;
begin

PROCESS(CLK,RST)
		BEGIN
				if (RST = '1') then
						next_state <= S0;
				elsif (CLK'event AND CLK='1') then
						CASE next_state IS
								when S0 =>
										if (START='1') then
												next_state <= S1;
										else
												next_state <= S0;
										end if;
										
								when S1 =>
								      count<= count-1;
										
										if (control_signal = "00" AND count /= 0) then
											    next_state <= S1;
										
										elsif (control_signal ="01" AND count /= 0)then
										       next_state <= S2;
										
										elsif (control_signal ="10" AND count /= 0)then
										       next_state <= S3;
										
										elsif (control_signal ="11" AND count /= 0)then
										       next_state <= S4;
									
										else
										       next_state <= S5;
										
										end if;
								
								when S2 =>
								      count<= count-1;
        								if (control_signal = "00"  AND count /= 0) then
											   next_state <= S1;
			
                      			elsif (control_signal ="01" AND count /= 0)then
										      next_state <= S2;
												
										elsif (control_signal ="10" AND count /= 0)then
										      next_state <= S3;
												 
										elsif (control_signal ="11" AND count /= 0)then
										      next_state <= S4;
												
										else
												next_state <= S5;
										
										end if;
								
								when S3 =>
								      count<= count-1;
										if (control_signal = "00"  AND count /= 0) then
												next_state <= S1;
												
										elsif (control_signal ="01" AND count /= 0)then
										      next_state <= S2;
												
										elsif (control_signal ="10" AND count /= 0)then
										      next_state <= S3;
												
										elsif (control_signal ="11" AND count /= 0)then
										      next_state <= S4;
												
										else
										      next_state <= S5;
										
										end if;
								
								when S4 =>
								      count<= count-1;
										if (control_signal = "00"  AND count /= 0) then
											   next_state <= S1;
												
										elsif (control_signal ="01" AND count /= 0)then
										      next_state <= S2;
												
										elsif (control_signal ="10" AND count /= 0)then
										      next_state <= S3;
												
										elsif (control_signal ="11" AND count /= 0)then
										      next_state <= S4;
												
										else
										      next_state <= S5;
										
										end if;
										
								when S5 =>
								      count<=K;
										
										if (START='1') then
												next_state <= S1;
												
										else
												next_state <= S0;
										
										end if;
								
								when OTHERS =>
												next_state <= S0;
						 
						 END CASE;
				
				end if;

END PROCESS;

PROCESS (next_state)
		BEGIN			 
				CASE next_state is
				
						when S1 =>
						
								Shift <= '1';
								Cin <= '0';
								Add <= '0';
								Done <= '0';
								Xored_IN <= '0';
								
						when S2 =>
				
								Shift <= '0';
								Cin <= '0';
								Add <= '1';
								Done <= '0';
								Xored_IN <= '0';
								
						when S3 =>
								
								Shift <= '0';
								Cin <= '1';
								Add <= '1';
								Done <= '0';
								Xored_IN <= '1';
								
						when S4 =>
						
								Shift <= '1';
								Cin <= '0';
								Add <= '0';
								Done <= '0';
								Xored_IN <= '0';
								
						when S5 =>
								
								Shift <= '0';
								Cin <= '0';
								Add <= '0';
								Done <= '1';
								Xored_IN <= '0';
								
						when OTHERS =>
								
								Shift <= '0';
								Cin <= '0';
								Add <= '0';
								Done <= '0';
								Xored_IN <= '0';
				END CASE;
END PROCESS;

end Behavioral;

