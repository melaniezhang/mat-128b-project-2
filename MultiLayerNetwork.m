function [ O ] = MultiLayerNetwork( InputList, InputWeights)
% PART 4!!!
% Format for InputList [x1;x2;x3;etc]
% Format for InputWeights cell array [W1;W2;W3;etc] with each Wi as a
% weight matrix

O = InputList;
for i=1:length(InputWeights)

    NET = InputWeights{i} * O;  % "NET = Xw", where X is the ith matrix
                                % contained in InputWeights and w is the
                                % input vector
    O = 1/(1+exp(-NET));                 % output is O = F(NET)
    O = O.';
end