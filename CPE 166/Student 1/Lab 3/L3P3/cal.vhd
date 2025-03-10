library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.all;
use IEEE.STD_LOGIC_unsigned.all;

entity cal is
port( 
	dout3, dout4 : in std_logic_vector(1 downto 0);
	b1,b2,b3, b4 : in std_logic;
	f : out std_logic_vector(3 downto 1));
end cal;

architecture Behavioral of cal is
begin
	process(b1,b2,b3,b4,dout3,dout4)
	begin
		if(b1='1') then
			f <= "000";
		elsif(b3='0' and b4='0') then
			if(b1/='1' and b2/='1') then
				if(dout4 > dout3 ) then
					f <= "001";	
				else
					f <= "000";
				end if;
			end if;
		elsif(b3='0' and b4='1') then
			if(b1/='1' and b2/='1') then
				f <= ("0"& dout4) + ("0"& dout3) ;
			end if;
		elsif(b3='1' and b4='0') then
			if(b1/='1' and b2/='1') then
				f <= ("0"& dout4) or ("0"& dout3);
			end if;
		elsif(b3='1' and b4='1') then
			if(b1/='1' and b2/='1') then
				f <= ("0"& dout4) and ("0"& dout3) ;
			end if;
		end if;
	end process;

end Behavioral;