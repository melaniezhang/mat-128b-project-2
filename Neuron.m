function [ OUT ] = Neuron( InputList, InputWeight )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
% Format for InputList [x1;x2;x3;etc]
% Format for InputWeight [y1 y2 y3 etc];
NET = InputWeight * InputList
OUT = 1/(1+exp(NET));
end

