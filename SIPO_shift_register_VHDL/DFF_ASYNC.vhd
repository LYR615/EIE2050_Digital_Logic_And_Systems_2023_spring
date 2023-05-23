----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2023/04/14 03:47:12
-- Design Name: 
-- Module Name: DFF_ASYNC - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DFF_ASYNC is
Port (D, CLK, RST: IN STD_LOGIC;
Q: OUT STD_LOGIC);
end DFF_ASYNC;

architecture DFF_ASYNC_ARCH of DFF_ASYNC is
begin

--  process(CLK)
--  begin
--    if CLK = '1' and CLK'event then
--   if(RST = '1')then
--    Q <= '0';
--   else
--    Q <= D;
--   end if;
--    end if;

  process(CLK, RST)
  begin
    if(RST = '1')then
     Q <= '0';
    elsif rising_edge(CLK) then
     Q <= D;
    end if;     
  end process;
  
end DFF_ASYNC_ARCH;