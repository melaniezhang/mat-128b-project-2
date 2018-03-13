% Assuming number of output nodes is 10 and input nodes is 9
function weights = initializeWeights(numLayers, nodesPerLayer)

weights = cell(1,numLayers);
weights{1} = -1 + 2*rand([9 nodesPerLayer]);
for i=2:(numLayers-1)
    weights{i} = -1 + 2*rand([nodesPerLayer nodesPerLayer]);
end
weights{numLayers} = -1 + 2*rand([nodesPerLayer 10]);

end