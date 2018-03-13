% testing MultiLayerNetworkTrain
%
% to actually extend this to a handwriting recognizer, each input will be a
% vector of length 9, with each entry of the vector representing one grid
% section of the image,
% and each target will be a vector of length 10 with
% zeroes in all entries EXCEPT the digit it represents. (exception: if it's
% 0 then the 10th entry will be 1)
%
% so for example, if input{1} is a vector representing the image of a
% handwritten 2, then target{1} will be [0; 1; 0; 0; 0; 0; 0; 0; 0; 0]
%
% i think matlab has a function that creates dummy variables in the format
% we want for each target entry!!
%
% also we need to make sure that the first weight matrix is n x 9 and the
% last weight matrix is 10 x m (for some n, m, doesn't matter as long as
% all the dimensions match up for adjacent matrices)
%
% the example below doesn't follow anything i just said above, it's just
% what i wrote up rn to make sure my code works lol

inputs = cell(1,3);
targets = cell(1,3);

inputs{1} = [1;2;3;4];
inputs{2} = [1;0;2;3];
inputs{3} = [2;0;1;3];

targets{1} = [1;0;0;0];
targets{2} = [0;1;0;0];
targets{3} = [0;0;1;0];

weights = cell(1,3);
for i=1:3
    weights{i} = rand([4 4]);
end
eta = 0.01;

% this function returns the set of weights that should have been updated
% through the training to maximize accuracy of prediction.
% i need to write more code to implement the actual testing that will come
% after the training. should b pretty straightforward
MultiLayerNetworkTrain(inputs, targets, weights, eta)