--*********************************************************
--* FILENAME dmem.vhd
--* AUTHOR:  meier@msoe.edu <Dr. M.>
--* DATE:    MSOE Spring 2016
--* PROVIDES:
--* - a 1024 location RAM memory of 32-bit words
--* - active-high memwr control signal
--* - falling-edge triggered sample
--* - one read port
--* - one write port
--*********************************************************

--*********************************************************
--* LOAD IEEE LIBRARY AND SPECIFY LIBRARY PACKAGES
--* - std_logic_1164: provides 9-valued standard logic type
--* - std_logic_1164: provides rising and falling edge 
--* - std_logic_unsigned: conv_integer function
--*********************************************************

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--*********************************************************
--* ENTITY DECLARATION
--* INPUT PORTS
--* - A: index into memory
--* - WD: 32-bit wide data to be written into memory 
--* - MEMWR: active-high write control signal
--* - CLK: memory samples on falling-edge
--* 
--* OUTPUT PORTS
--* - RD: memory output data
--*********************************************************
entity dmem is
port(A: in std_logic_vector(31 downto 0);
     WD: in std_logic_vector(31 downto 0);
	  MEMWR, RST, CLK: in std_logic;
	  RD: out std_logic_vector(31 downto 0));
end entity dmem;

--*********************************************************
--* ARCHITECTURAL DESCRIPTION
--* - MEMARRAYTYPE: an abstract collection of 32-bit words
--* - MEMARRAY: an instance of MEMARRAYTYPE
--*********************************************************
architecture behavioral of dmem is
  type MEMARRAYTYPE is array(31 downto 0)
       of std_logic_vector(31 downto 0);
  signal MEMARRAY: MEMARRAYTYPE;
  signal address: integer range 31 downto 0;
  
begin
  address <= to_integer(unsigned(A(4 downto 0)));
  -- asynchronous read: does not depend on clock edge
  RD <= MEMARRAY(address);
  
  -- synchronous write update process
  -- simulating large memory that does not have reset
  UPDATE: process(CLK,MEMWR)
  begin
    if falling_edge(CLK) then 
	   if MEMWR = '1' then 
		  MEMARRAY(address) <= WD;
		end if;
    end if;
  end process;
  
end architecture behavioral;

 