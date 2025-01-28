clc
clear all
close all

a = 1000;
binaryString = dec2bin(a);
binaryArray = arrayfun(@(x) str2double(x), binaryString);
disp(binaryArray);
numBits = length(binaryString);
disp(['Number of bits: ', num2str(numBits)]);