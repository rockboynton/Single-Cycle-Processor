

-- ************************MY MUL IROM***********************
-- --*********************************************************
-- --* FILENAME: irom.vhd
-- --* AUTHOR:   boyntonrl@msoe.edu <Rock Boynton>
-- --* DATE:     Spring Quarter 2018
-- --* PROVIDES: 
-- --* - ROM for test program for the DE-10 Lite computer
-- --* - count down the n integers
-- --*   where n is the value put on the Sliders
-- --* - displays value to the SEG7 and blinks the LEDs
-- --*********************************************************

-- --*********************************************************
-- --* INCLUDE LIBRARIES AND PACKAGES
-- --* - std_logic_1164: 9-valued logic
-- --*********************************************************
-- library ieee;
-- use ieee.std_logic_1164.all;

-- --*********************************************************
-- --* ENTITY DECLARATION
-- --* INPUT PORTS
-- --* - A: 32-bit memory address
-- --* 
-- --* OUTPUT PORTS
-- --* - RD: 32-bit memory data
-- --*********************************************************

-- entity irom is 
-- port(A: in std_logic_vector(31 downto 0);
--      RD: out std_logic_vector(31 downto 0));
-- end entity irom;

-- architecture dataflow of irom is
-- begin
--   with A select RD <=
-- 	X"E3A0_90F4" when X"00000000", --main:   MOV R7,#SLIDER  ; R7 = SLIDER (.equ SLIDER, 0x000000F4)
-- 	X"E599_8000" when X"00000004", --        mov r8,#SEG7    ; R8 = SEG7
-- 	X"E3A0_7000" when X"00000008", --        mov r6,#LED 	 ; R6 = LED
-- 	X"E3A0_60FC" when X"0000000C", --        mov r9,#1		 ; R9 = 1
-- 	X"E3A0_50F8" when X"00000010", --        cmp r7,#0		; R7 = 0?
-- 	X"E358_0000" when X"00000014", --        cmp r7,#0		; R7 = 0?
-- 	X"0A00_0008" when X"00000018", --        cmp r7,#0		; R7 = 0?
-- 	X"EB00_0008" when X"0000001C", --        if R7 = 0 then wait
-- 	X"E1A0_1000" when X"00000020", --        bl formDelay    ; form delay constant 

-- 	X"E586_8000" when X"00000024", --maindo: 
-- 	X"E585_4000" when X"00000028", --maindo: 
-- 	X"E224_40FF" when X"0000002C", --        
-- 	X"EB00_000A" when X"00000030", --        
-- 	X"E248_8001" when X"00000034", --        
-- 	X"E358_0000" when X"00000038", --        
-- 	X"1AFF_FFF8" when X"0000003C", --        

-- 	X"EAFF_FFFE" when X"00000040", --wait:        b wait		; infinite loop

-- 	X"E3A0_10FF" when X"00000044", --formDelay: 
-- 	X"E3A0_30FF" when X"00000048", --
-- 	X"E002_0391" when X"0000004C", --
-- 	X"E004_0291" when X"00000050", --
-- 	X"E3A0_1003" when X"00000054", --
-- 	X"E000_0194" when x"00000058", --
-- 	X"E1A0_F00E" when x"0000005C", --

-- 	X"E3A0_2000" when x"00000060", --delay:
-- 	X"E1A0_3001" when x"00000064", --
-- 	X"E282_2001" when x"00000068", --
-- 	X"E152_0003" when x"0000006C", --
-- 	X"1AFF_FFFC" when x"00000070", --
-- 	X"E1A0_F00E" when others; --

-- end architecture dataflow;



--********************MY SIMPLE IROM*****************************
--*********************************************************
--* FILENAME: irom.vhd
--* AUTHOR:   boyntonrl@msoe.edu <Rock Boynton>
--* DATE:     Spring Quarter 2018
--* PROVIDES: 
--* - ROM for test program for the DE-10 Lite computer
--* - count down the n integers
--*   where n is the value put on the Sliders
--* - displays value to the SEG7 and blinks the LEDs
--*********************************************************

--*********************************************************
--* INCLUDE LIBRARIES AND PACKAGES
--* - std_logic_1164: 9-valued logic
--*********************************************************
library ieee;
use ieee.std_logic_1164.all;

--*********************************************************
--* ENTITY DECLARATION
--* INPUT PORTS
--* - A: 32-bit memory address
--* 
--* OUTPUT PORTS
--* - RD: 32-bit memory data
--*********************************************************

entity irom is 
port(A: in std_logic_vector(31 downto 0);
     RD: out std_logic_vector(31 downto 0));
end entity irom;

architecture dataflow of irom is
begin
  with A select RD <=
	X"E3A0_90F4" when X"00000000", --main:   MOV R7,#SLIDER  ; R7 = SLIDER (.equ SLIDER, 0x000000F4)
	X"E599_8000" when X"00000004", --        mov r8,#SEG7    ; R8 = SEG7
	X"E3A0_7000" when X"00000008", --        mov r6,#LED 	 ; R6 = LED
	X"E3A0_60FC" when X"0000000C", --        mov r9,#1		 ; R9 = 1
	X"E3A0_50F8" when X"00000010", --        cmp r7,#0		; R7 = 0?
	X"E358_0000" when X"00000014", --        cmp r7,#0		; R7 = 0?
	X"0A00_0010" when X"00000018", --        cmp r7,#0		; R7 = 0?

	X"E3A0_10FF" when X"0000001C", --formDelay: 
	X"E081_1001" when X"00000020", --
	X"E081_1001" when X"00000024", --
	X"E081_1001" when X"00000028", --
	X"E081_1001" when X"0000002C", --
	X"E081_1001" when X"00000030", --
	X"E081_1001" when X"00000034", --
	X"E081_1001" when X"00000038", --
	X"E081_1001" when X"0000003C", --
	X"E081_1001" when X"00000040", --
	X"E081_1001" when X"00000044", --
	X"E081_1001" when X"00000048", --
	X"E081_1001" when X"0000004C", --
	X"E081_1001" when X"00000050", --
	X"E081_1001" when X"00000054", --
	X"E081_1001" when X"00000058", --
	X"E081_0001" when X"0000005C", --

	X"E586_8000" when X"00000060", --maindo: 
	X"E585_A000" when X"00000064", --maindo: 
	X"E22A_A0FF" when X"00000068", --   C
	
	X"E3A0_2000" when x"0000006C", --delay:
	X"E1A0_3000" when x"00000070", --gg
	X"E282_2001" when x"00000074", --
	X"E152_0003" when x"00000078", --
	X"1AFF_FFFC" when x"0000007C", --

	X"E248_8001" when X"00000080", --        
	X"E358_0000" when X"00000084", --        
	X"1AFF_FFF4" when X"00000088", --   

	X"EAFF_FFFE" when others; --wait:        b wait		; infinite loop

end architecture dataflow;



--*********************DRAVENS IROM**************************
-- --*********************************************************
-- --* FILENAME: irom.vhd
-- --* AUTHOR:   boyntonrl@msoe.edu <Rock Boynton>
-- --* DATE:     Spring Quarter 2018
-- --* PROVIDES: 
-- --* - ROM for test program for the DE-10 Lite computer
-- --* - count down the n integers
-- --*   where n is the value put on the Sliders
-- --* - displays value to the SEG7 and blinks the LEDs
-- --*********************************************************

-- --*********************************************************
-- --* INCLUDE LIBRARIES AND PACKAGES
-- --* - std_logic_1164: 9-valued logic
-- --*********************************************************
-- library ieee;
-- use ieee.std_logic_1164.all;

-- --*********************************************************
-- --* ENTITY DECLARATION
-- --* INPUT PORTS
-- --* - A: 32-bit memory address
-- --* 
-- --* OUTPUT PORTS
-- --* - RD: 32-bit memory data
-- --*********************************************************

-- entity irom is 
-- port(A: in std_logic_vector(31 downto 0);
--      RD: out std_logic_vector(31 downto 0));
-- end entity irom;

-- architecture dataflow of irom is
-- begin
--   with A select RD <=
-- 	X"E3A0_00F4" when X"00000000", --main:   MOV R7,#SLIDER  ; R7 = SLIDER (.equ SLIDER, 0x000000F4)
-- 	X"E3A0_10FC" when X"00000004", --        mov r8,#SEG7    ; R8 = SEG7
-- 	X"E310_20F8" when X"00000008", --        mov r6,#LED 	 ; R6 = LED
-- 	X"E590_7000" when X"0000000C", --        mov r9,#1		 ; R9 = 1
-- 	X"E3A0_4000" when X"00000010", --        cmp r7,#0		; R7 = 0?
-- 	X"E582_4000" when X"00000014", --        cmp r7,#0		; R7 = 0?
-- 	X"E3A0_8000" when X"00000018", --        cmp r7,#0		; R7 = 0?

-- 	X"E3A0_9004" when X"0000001C", --formDelay: 
-- 	X"E003_0998" when X"00000020", --
-- 	X"E3A0_30FF" when X"00000024", --
-- 	X"E3570000" when X"00000028", --
-- 	X"0A00000F" when X"0000002C", --
-- 	X"E3A080FF" when X"00000030", --
-- 	X"E3A090FF" when X"00000034", --
-- 	X"E00A0998" when X"00000038", --
-- 	X"E00B089A" when X"0000003C", --
-- 	X"E3A08002" when X"00000040", --
-- 	X"E00A089B" when X"00000044", --
-- 	X"E5817000" when X"00000048", --
-- 	X"E0244003" when X"0000004C", --
-- 	X"E5824000" when X"00000050", --
-- 	X"E1A0800A" when X"00000054", --
-- 	X"E2488001" when X"00000058", --
-- 	X"E3580000" when X"0000005C", --

-- 	X"1AFFFFFC" when X"00000060", --maindo: 
-- 	X"E2477001" when X"00000064", --maindo: 
-- 	X"E3570000" when X"00000068", --   C
	
-- 	X"1AFFFFF5" when x"0000006C", --delay:
-- 	X"E5817000" when x"00000070", --gg
-- 	X"E0244003" when x"00000074", --
-- 	X"E5824000" when x"00000078", --
-- 	X"EAFFFFFE" when x"0000007C", --

-- 	X"EAFFFFFE" when others;

-- end architecture dataflow;


--*********************IROMV5**********************
----*********************************************************
----* FILENAME: irom.vhd
----* AUTHOR:   meier@msoe.edu <Dr. Meier>
----* MODIFIED: durant@msoe.edu <Dr. Durant>, 2018-05-06
----* - added assembly syntax as comments behind hexadecimal
----* DATE:     Spring Quarter 2018
----* PROVIDES: 
----* - ROM for test program for the single cycle processor
----* - calculates the sum of the first n integers
----*   where n is loaded into register R8
----* - sets memory[4] = 1 if sum >=32
----* - tests memory-mapped I/O (sliders for input, SEG7 and LEDs for output)
----*********************************************************
--
----*********************************************************
----* INCLUDE LIBRARIES AND PACKAGES
----* - std_logic_1164: 9-valued logic
----*********************************************************
--library ieee;
--use ieee.std_logic_1164.all;
--
----*********************************************************
----* ENTITY DECLARATION
----* INPUT PORTS
----* - A: 32-bit memory address
----* 
----* OUTPUT PORTS                                                   
----* - RD: 32-bit memory data
----*********************************************************
--
--entity irom is 
--port(A: in std_logic_vector(31 downto 0);
--     RD: out std_logic_vector(31 downto 0));
--end entity irom;
--
--architecture dataflow of irom is
--begin
--  with A select RD <=
--	X"E3A0_4004" when X"00000000", --main:   MOV R4,#4       ; R4 = memory address
--	X"E3A0_C000" when X"00000004", --        MOV R12,#0      ; temp = 0
--	X"E584_C000" when X"00000008", --        STR R12,[R4]    ; MEM[4] = 0 : init memory
--	X"E3A0_C0F4" when X"0000000C", --        MOV R12,#SLIDE  ; address of sliders (.equ SLIDE,0x000000F4)
--	X"E59C_8000" when X"00000010", --        LDR R8,[R12]    ; i = n
--	X"E3A0_9000" when X"00000014", --        MOV R9,#0       ; sum = 0
--	X"E358_0000" when X"00000018", --        CMP R8,#0       ; i=0?
--	X"0A00_000A" when X"0000001C", --        BEQ print       ; if yes branch to print
--	X"E089_9008" when X"00000020", --loop:   ADD R9,R9,R8    ; sum = sum + i
--	X"E248_8001" when X"00000024", --        SUB R8,R8,#1    ; i = i - 1
--	X"E358_0000" when X"00000028", --        CMP R8,#0
--	X"1AFF_FFFB" when X"0000002C", --        BNE loop
--	X"E3A0_A000" when X"00000030", --if:     MOV R10,#0      ; creating FFFFFFE0
--	X"E24A_A020" when X"00000034", --        SUB R10,R10,#32 ; 0 - 32 = -32 = FFFFFFE0
--	X"E009_A00A" when X"00000038", --        AND R10,R9,R10
--	X"E35A_0000" when X"0000003C", --        CMP R10,#0
--	X"0A00_0000" when X"00000040", --        BEQ else        ; if (R9 > 32) MEM[4] = 1
--	X"E3A0_A001" when X"00000044", --        MOV R10,#1      ; set the 1
--	X"E584_A000" when X"00000048", --else:   STR R10,[R4]    ; memory[4] = either 1 or 0
--	X"E3A0_C0FC" when X"0000004C", --print:  MOV R12,#SEG7   ; seg7 data reg address (.equ SEG7,0x000000fc)
--	X"E58C_9000" when X"00000050", --        STR R9,[R12]    ; seg7 = sum
--	X"E3A9_C0F8" when X"00000054", --        MOV 12,#LED     ; LED reg address (.equ LED,0x000000F8)
--	X"E594_3000" when x"00000058", --        LDR R3,[R4]     ; get stored memory value back
--	X"E58C_3000" when x"0000005C", --        STR R3,[R12]    ; leds = mem[4] : is it >32? LED0 on
--	X"EAFF_FFFE" when others;      --done:   B done 
--
--end architecture dataflow;





--********************IROMV4**********************
-- --*********************************************************
-- --* FILENAME: irom.vhd
-- --* AUTHOR:   meier@msoe.edu <Dr. M>
-- --* DATE:     Spring Quarter 2016
-- --* PROVIDES: 
-- --* - a test program for the first single cycle processor
-- --* - calculates the sum of the first n integers
-- --*   where n is loaded into register R8
-- --* - sets memory[4] = 1 if sum >=32
-- --* - infinite loops reading memory[4]
-- --*********************************************************

-- --*********************************************************
-- --* INCLUDE LIBRARIES AND PACKAGES
-- --* - std_logic_1164: 9-valued logic
-- --*********************************************************
-- library ieee;
-- use ieee.std_logic_1164.all;

-- --*********************************************************
-- --* ENTITY DECLARATION
-- --* INPUT PORTS
-- --* - A: 32-bit memory address
-- --* 
-- --* OUTPUT PORTS
-- --* - RD: 32-bit memory data
-- --* 
-- --* DISCUSSION
-- --* - this instruction ROM is a read-only memory 
-- --* - it never writes and thus needs no sample clock
-- --* - it never writes and thus needs no reset
-- --* - ROM memories are simple truth tables
-- --*********************************************************

-- entity irom is 
-- port(A: in std_logic_vector(31 downto 0);
--      RD: out std_logic_vector(31 downto 0));
-- end entity irom;

-- architecture dataflow of irom is
-- begin
 
--   with A select
--   RD <= 
--         X"E3A0_000A" when X"00000000",
--         X"EB00_0009" when X"00000004",  
--         X"E3A0_A000" when X"00000008",
--         X"E24A_A020" when X"0000000C",
--         X"E000_A00A" when X"00000010", 
-- 	X"E35A_0000" when X"00000014",
-- 	X"0A00_0002" when X"00000018",
-- 	X"E3A0_B001" when X"0000001C",
--         X"E3A0_C004" when X"00000020",
-- 	X"E58C_B000" when X"00000024",
-- 	X"E59C_6000" when X"00000028",
-- 	X"EAFF_FFFD" when X"0000002C",
-- 	X"E350_0000" when X"00000030",
-- 	X"0A00_0005" when X"00000034",
-- 	X"E3A0_1000" when X"00000038",
-- 	X"E081_1000" when X"0000003C",
-- 	X"E240_0001" when X"00000040",
-- 	X"E350_0000" when X"00000044",
-- 	X"1AFF_FFFB" when X"00000048",
-- 	X"E1A0_0001" when X"0000004C",
-- 	X"E1A0_F00E" when others;
		  
-- end architecture dataflow;


