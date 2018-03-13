% Assuming number of output nodes is 10 and input nodes is 9
function weights = initializeWeights(numLayers, nodesPerLayer)

weights = cell(1,numLayers);
weights{1} = -0.25 + 0.5*rand([784 nodesPerLayer]);
for i=2:(numLayers-1)
    weights{i} = -0.25 + 0.5*rand([nodesPerLayer nodesPerLayer]);
end
weights{numLayers} = -0.25 + 0.5*rand([nodesPerLayer 10]);

end