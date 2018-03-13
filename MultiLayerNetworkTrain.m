function weights = MultiLayerNetworkTrain(inputs, targets, weights, eta)
% PART 6 -- this probably doesn't work yet
% for now, i am assuming inputs and targets are cell arrays...
% if using matrices turns out 2 be more useful then just change syntax below


% EXPECTED INPUT FORMAT:
% inputs: cell array of input COLUMN vectors
% targets: cell array of output COLUMN vectors
% ---- inputs & targets should be same length, they are our training pairs ----
% weights: cell array of weight matrices. make sure weights{1} has the same
%           number of columns as each input has entries, and
%           weights{length(weights)} has same number of rows as each target
%           has entries
% eta: a scalar between 0.01 and 0.1

numLayers = length(weights);

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
    error = output - targets{i};  % dont know if abs should be there
    delta = output .* (1.-output) .* error;
    weightUpdate = eta* OUT{numLayers-1}' * delta;
    weights{numLayers} = weights{numLayers} - weightUpdate;
    
    % for other hidden layers
    for j=numLayers-1:-1:2
        delta = (delta * weights{j+1}') .* OUT{j} .* (1.-OUT{j});
        weightUpdate = eta * OUT{j-1}' * delta;
        weights{j} = weights{j} - weightUpdate;
    end
    
end