function [percentWrong, totalErrorRate] = MultiLayerNetworkTest(inputs, targets, weights)

numLayers = length(weights);

errors = zeros(1, 10);

totalErrorRate = 0;

for i=1:length(inputs)
    O = inputs{i};
    OUT = cell(1, numLayers);
    % forward pass -------------------------------------------------------
    for j=1:numLayers
        NET =  O * weights{j};  % "NET = Xw", where X is the ith matrix
                               % contained in InputWeights and w is the
                               % input vector
        O = 1./(1 + exp(-NET));   % output is O = F(NET)
        OUT{j} = O;
    end
    
    % backward pass ------------------------------------------------------
    
    % for last layer
    output = OUT{numLayers};
    [Mout, Iout] = max(abs(output));
    [Mtarg, Itarg] = max(abs(targets{i}));
    errors(mod(i - 1,10) + 1) = errors(mod(i - 1,10) + 1) + (Iout ~= Itarg);
    totalErrorRate = totalErrorRate + (Iout ~= Itarg);
end

percentWrong = errors./(length(inputs)/10);
percentWrong = percentWrong * 100;

totalErrorRate = totalErrorRate * 100 / length(inputs) ; 
end