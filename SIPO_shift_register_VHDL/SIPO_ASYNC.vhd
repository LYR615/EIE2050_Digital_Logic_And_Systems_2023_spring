----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2023/04/14 03:44:14
-- Design Name: 
-- Module Name: SIPO_ASYNC - Behavioral
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

entity SIPO_ASYNC is
Port (D, CLK, RST: IN STD_LOGIC;
Q: OUT STD_LOGIC_VECTOR(7 downto 0));
end SIPO_ASYNC;

architecture SIPO_ASYNC_ARCH of SIPO_ASYNC is
component DFF_ASYNC is
port(D, CLK, RST: in STD_LOGIC;
Q: out STD_LOGIC);
end component;
signal dout: STD_LOGIC_VECTOR(7 downto 0);
begin
DFF0:DFF_ASYNC port map(D, CLK, RST, dout(0));
DFF1:DFF_ASYNC port map(dout(0), CLK, RST, dout(1));
DFF2:DFF_ASYNC port map(dout(1), CLK, RST, dout(2));
DFF3:DFF_ASYNC port map(dout(2), CLK, RST, dout(3));
DFF4:DFF_ASYNC port map(dout(3), CLK, RST, dout(4));
DFF5:DFF_ASYNC port map(dout(4), CLK, RST, dout(5));
DFF6:DFF_ASYNC port map(dout(5), CLK, RST, dout(6));
DFF7:DFF_ASYNC port map(dout(6), CLK, RST, dout(7));
Q <= dout;
end SIPO_ASYNC_ARCH;
