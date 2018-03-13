function [averageError, stdError, numWrong] = MultiLayerNetworkTest(inputs, targets, weights)

numLayers = length(weights);

errors = zeros(length(inputs), 10);

numWrong = 0;

for i=1:length(inputs)
    O = inputs{i};
    OUT = cell(1, numLayers);
    % forward pass -------------------------------------------------------
    for j=1:numLayers
        NET =  O * weights{j};  % "NET = Xw", where X is the ith matrix
                               % contained in InputWeights and w is the
                               % input vector
        O = 1./(1.+exp(-NET));   % output is O = F(NET)
        OUT{j} = O;
    end
    
    % backward pass ------------------------------------------------------
    
    % for last layer
    output = OUT{numLayers};
    errors(i,:) = abs(output - targets{i});
    [Mout, Iout] = max(abs(output));
    [Mtarg, Itarg] = max(abs(targets{i}));
    numWrong = numWrong + (Iout ~= Itarg);
end

averageError = mean(errors);
stdError = std(errors);

end