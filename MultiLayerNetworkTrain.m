function [ O ] = MultiLayerNetworkTrain(inputs, targets, weights, eta)
% for now, i am assuming inputs and targets are cell arrays.
% if using matrices turns out 2 be more useful then just change syntax below

numLayers = length(weights);

for i=1:length(inputs)
    O = inputs{i};
    OUT = cell(1, numLayers);
    % forward pass
    for j=1:numLayers
        NET = weights{j} * O;  % "NET = Xw", where X is the ith matrix
                               % contained in InputWeights and w is the
                               % input vector
        O = 1/(1+exp(-NET));   % output is O = F(NET)
        OUT{j} = O;
        O = O.';
    end
    
    % backward pass
    
    % for last layer
    output = OUT{numLayers};
    error = output - targets{i};
    delta = output .* (1 - output) .* error;
    weightUpdate = eta * delta .* OUT{numLayers-1};
    weights{numLayers} = weights{numLayers} + weightUpdate;
    
    % for other hidden layers
    for j=numLayers-1:-1:1
        delta = (delta * weights{j}.') .* OUT{j} .* (1-OUT{j});
        weightUpdate = eta * delta .* OUT{j-1};
        weights{j} = weights{j} + weightUpdate;
    end
    
end