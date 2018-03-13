function [inputs, targets] = generateInsOuts(datasetName, trainLength)

load(datasetName);

if(trainLength > 5421)
   trainLength = 5421;
end

rawTrainData = cell(1, 10);
rawTrainData{1} = train0;
rawTrainData{2} = train1;
rawTrainData{3} = train2;
rawTrainData{4} = train3;
rawTrainData{5} = train4;
rawTrainData{6} = train5;
rawTrainData{7} = train6;
rawTrainData{8} = train7;
rawTrainData{9} = train8;
rawTrainData{10} = train9;

inputs = cell(1, 10*trainLength);
targets = cell(1, 10*trainLength);

j = 1;
for i = 1:(10*trainLength)
    train = rawTrainData{j};
    digit = train(ceil(i/10),:);
    digitimage = reshape(digit, 28, 28);
    
    parts = mat2cell(digitimage, [10, 8, 10], [10, 8, 10]);
    
    inputbuff = zeros(1, 9);
    for k = 1:9
       inputbuff(k) = (max(parts{k}(:)) > 0); 
    end
    inputs{i} = inputbuff;
    
    targets{i} = 1:10;
    targets{i} = (targets{i} == j);
    
    j = j + 1;
    if j > 10
       j = j - 10; 
    end
end

clear -regexp ^train ^test;

end