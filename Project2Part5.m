% PART 5!
% Initialize the network by assigning a random (small) number to each
% weight
n = 3;  % number of layers
WeightMatrices = cell(1,n);
for i=1:n
    WeightMatrices{i} = rand([4 4]);  % weights for each layer, initialized
                                      % to be random numbers between 0 and 1
end

input = [1; 2; 3; 4];

MultiLayerNetwork(input, WeightMatrices)
