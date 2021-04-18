----------------------------------------------------------------------------------
-- Create Date:    20:59:38 04/15/2021 
-- Designer Name:  Gaurav Kumar
-- Module Name:    Booth_multiplier - Behavioral 

----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;


entity Booth_multiplier is
    Generic ( K: integer:=8);
	 Port ( CLK,RST : in STD_LOGIC;
	        Multiplicand : in  STD_LOGIC_VECTOR(K-1 downto 0);
           Multiplier : in  STD_LOGIC_VECTOR(K-1 downto 0);
           Product : out  STD_LOGIC_VECTOR(K-1 downto 0);
			  Done : out STD_LOGIC);
end Booth_multiplier;

architecture Behavioral of Booth_multiplier is
-->>>>>>>>>>Signal And Enitity Declaration For K bit Booth Multiplier -->>>>>>>>>>

Signal A,A_in: STD_LOGIC_VECTOR(2*K downto 0);
Signal P,P_in: STD_LOGIC_VECTOR(2*K downto 0);

Signal Zero: INTEGER:=0;

-->>>>>>>>>>Signal And Enitity Declaration For K bit Booth Controller -->>>>>>>>>>

Component Booth_Controller is
 Generic ( K: integer);
    Port ( CLK,RST,START: in STD_LOGIC;
	       control_signal: in STD_LOGIC_VECTOR(1 downto 0);
	       Shift,Done,Cin,Add,Xored_IN:out STD_LOGIC
			 );
end Component;
Signal Shift_control,Add_control,Cin,START,Xored_IN_control: STD_LOGIC;

-->>>>>>>>>>Signal And Enitity Declaration For Right Shiftf by 1 bit--->>>>>>>>>>

Component Right_Shift_1bit is
 Generic ( K :integer);
    Port ( 
	        A : in  STD_LOGIC_VECTOR (K-1 downto 0);
           Z : out  STD_LOGIC_VECTOR (K-1 downto 0));
end Component;
Signal shifted_in: STD_LOGIC_VECTOR(2*K downto 0);

-->>>>>>>>>>Signal And Enitity Declaration For Right Shiftf by 1 bit--->>>>>>>>>>

Component CLA_Adder is
    Generic (K: integer);
    Port ( A : in  STD_LOGIC_VECTOR(K-1 downto 0);
           B : in  STD_LOGIC_VECTOR(K-1 downto 0);
			  Cin: in STD_LOGIC:='0';
           sum_output : out  STD_LOGIC_VECTOR(K-1 downto 0);
           carry_output : out  STD_LOGIC);
end Component;

Signal carry: STD_LOGIC;
Signal sum: STD_LOGIC_VECTOR(2*K downto 0);

-->>>>>>>>>>Signal And Enitity Declaration For K bit Xored Input------->>>>>>>>>>

Component Xored_Input is
 Generic ( K : integer);  
	 Port ( A : in  STD_LOGIC_VECTOR (K-1 downto 0);
           Z : out  STD_LOGIC_VECTOR (K-1 downto 0));
end Component;

Signal xor_in: STD_LOGIC_VECTOR(2*K downto 0);

------>>>>>>>>>>-------------------------------------------------------<<<<<<<<<<
begin

PROCESS(START)
BEGIN
IF(START='1')Then

A(2*K downto K+1) <= Multiplicand;
A(K downto 0) <= CONV_STD_LOGIC_VECTOR(Zero,K +1); 
P(2*K downto K+1) <= CONV_STD_LOGIC_VECTOR(Zero,K); 
P(K downto 1) <= Multiplier;
P(0)<='0';
END IF;
END PROCESS;

CONT0: Booth_Controller generic map(K=>K) port map(CLK=>CLK,RST=>RST,START=>START,
                        control_signal=>shifted_in(1 downto 0),Shift=>Shift_control,Done=>Done,
								Cin=>Cin,Add=>Add_control,Xored_IN=>Xored_IN_control);
RS1B0:Right_Shift_1bit generic map(K=>(2*K + 1)) port map(A=>P_in,Z=>shifted_in);

CLA: CLA_Adder generic map(K=>(2*K + 1)) port map(A=>P_in,B=>A_in,Cin=>Cin,sum_output=>sum,carry_output=>carry);
														  
XORI: Xored_Input generic map(K=> (2*K + 1)) port map(A=>A,Z=>xor_in); 								

PROCESS(RST)
  BEGIN
	  IF (RST='0') THEN
	     START<='1';
	  ELSE
	     START<='0';
	  END IF;
END PROCESS;

PROCESS(CLK,Add_control,Shift_control)
 BEGIN
  IF((CLK'event AND CLK='1' ) AND Add_control='1')then
   P_in(2*k -1 downto 0)<= sum(2* K downto 1);
   P_in(2*k)<= '0';
  ELSIF((CLK'event AND CLK='1' ) AND Shift_control='1')then
   P_in<= shifted_in;
  ELSIF(CLK'event AND CLK='1' AND Add_control='0' AND Shift_control='0') then
   P_in<= P;
	end if;
END PROCESS;


PROCESS(CLK,Xored_IN_control)
 BEGIN
  IF( Xored_IN_control='1')then
   A_in<= xor_in;
  ELSIF( Xored_IN_control='0')then
   A_in<= A;
	end if;
END PROCESS;


end Behavioral;

