-- ***************************************************************************************
-- * PROJECT: LW8 - Single-Cycle Processor Design FPGA
-- * FILENAME: seg7decode.vhd
-- * AUTHOR: boyntonrl@msoe.edu <Rock Boynton>
-- * DESCRIPTION: 
-- * - Seven segment display decoder
-- ***************************************************************************************

library IEEE;
use IEEE.std_logic_1164.all;

--Inputs:  A, a vector of the unsigned binary code
--         E, an enable, active LOW
--Outputs: Y, a vector of the output, each bit corresponding to a part of the seven segment decoder
--            as defined by the DE-10 lite manual


entity seg7decode is 
	port(
		A:    in std_logic_vector(31 downto 0);
		SEG5,SEG4,SEG3,SEG2,SEG1,SEG0: out std_logic_vector(7 downto 0)
		);
end entity seg7decode;

architecture dataflow of seg7decode is 

	-- HEX values
	constant zero      : std_logic_vector(7 downto 0) := B"11000000"; 
	constant one       : std_logic_vector(7 downto 0) := B"11111001"; 
	constant two       : std_logic_vector(7 downto 0) := B"10100100";
	constant three     : std_logic_vector(7 downto 0) := B"10110000";
	constant four      : std_logic_vector(7 downto 0) := B"10011001"; 
	constant five      : std_logic_vector(7 downto 0) := B"10010010"; 
	constant six       : std_logic_vector(7 downto 0) := B"10000010"; 
	constant seven     : std_logic_vector(7 downto 0) := B"11011000"; 
	constant eight     : std_logic_vector(7 downto 0) := B"10000000"; 
	constant nine      : std_logic_vector(7 downto 0) := B"10011000"; 
	constant letterA   : std_logic_vector(7 downto 0) := B"10001000"; 
	constant letterB   : std_logic_vector(7 downto 0) := B"10000011"; 
	constant letterC   : std_logic_vector(7 downto 0) := B"10100111"; 
	constant letterD   : std_logic_vector(7 downto 0) := B"10100001"; 
	constant letterE   : std_logic_vector(7 downto 0) := B"10000110"; 
	constant letterF   : std_logic_vector(7 downto 0) := B"10001110";  
		
begin

	with A(3 downto 0) select 
	SEG0 <= zero    when X"0",
			 one     when X"1",
			 two     when X"2",
			 three   when X"3",
			 four    when X"4",
			 five    when X"5",
			 six     when X"6",
			 seven   when X"7",
			 eight   when X"8",
			 nine    when X"9",
			 letterA when X"A",
			 letterB when X"B",
			 letterC when X"C",
			 letterD when X"D",
			 letterE when X"E",
			 letterF when others;
				  
    with A(7 downto 4) select 
    SEG1 <= zero    when X"0",
             one     when X"1",
             two     when X"2",
             three   when X"3",
             four    when X"4",
             five    when X"5",
             six     when X"6",
             seven   when X"7",
             eight   when X"8",
             nine    when X"9",
             letterA when X"A",
             letterB when X"B",
             letterC when X"C",
             letterD when X"D",
             letterE when X"E",
             letterF when others;
             
    with A(11 downto 8) select 
	SEG2 <= zero    when X"0",
			 one     when X"1",
			 two     when X"2",
			 three   when X"3",
			 four    when X"4",
			 five    when X"5",
			 six     when X"6",
			 seven   when X"7",
			 eight   when X"8",
			 nine    when X"9",
			 letterA when X"A",
			 letterB when X"B",
			 letterC when X"C",
			 letterD when X"D",
			 letterE when X"E",
             letterF when others;
             
    with A(15 downto 12) select 
	SEG3 <= zero    when X"0",
			 one     when X"1",
			 two     when X"2",
			 three   when X"3",
			 four    when X"4",
			 five    when X"5",
			 six     when X"6",
			 seven   when X"7",
			 eight   when X"8",
			 nine    when X"9",
			 letterA when X"A",
			 letterB when X"B",
			 letterC when X"C",
			 letterD when X"D",
			 letterE when X"E",
             letterF when others;
             
    with A(19 downto 16) select 
	SEG4 <= zero    when X"0",
			 one     when X"1",
			 two     when X"2",
			 three   when X"3",
			 four    when X"4",
			 five    when X"5",
			 six     when X"6",
			 seven   when X"7",
			 eight   when X"8",
			 nine    when X"9",
			 letterA when X"A",
			 letterB when X"B",
			 letterC when X"C",
			 letterD when X"D",
			 letterE when X"E",
             letterF when others;
             
    with A(23 downto 20) select 
	SEG5 <= zero    when X"0",
			 one     when X"1",
			 two     when X"2",
			 three   when X"3",
			 four    when X"4",
			 five    when X"5",
			 six     when X"6",
			 seven   when X"7",
			 eight   when X"8",
			 nine    when X"9",
			 letterA when X"A",
			 letterB when X"B",
			 letterC when X"C",
			 letterD when X"D",
			 letterE when X"E",
			 letterF when others;
			  		
end architecture dataflow;