function [inputs, targets] = generateTests(datasetName, numTests)

load(datasetName);

if(numTests > 892)
   numTests = 892;
end

rawTrainData = cell(1, 10);
rawTrainData{1} = test0;
rawTrainData{2} = test1;
rawTrainData{3} = test2;
rawTrainData{4} = test3;
rawTrainData{5} = test4;
rawTrainData{6} = test5;
rawTrainData{7} = test6;
rawTrainData{8} = test7;
rawTrainData{9} = test8;
rawTrainData{10} = test9;

inputs = cell(1, 10*numTests);
targets = cell(1, 10*numTests);

j = 1;
for i = 1:(10*numTests)
    train = rawTrainData{j};
    digit = train(ceil(i/10),:);
    digitimage = reshape(digit, 28, 28);
    digitimage = rot90(flipud(digitimage),-1);
    digitimage = digitimage(:);
    digitimage = (digitimage > 0);
    inputs{i} = digitimage';
    
    targets{i} = 1:10;
    targets{i} = (targets{i} == j);
    
    j = j + 1;
    if j > 10
       j = j - 10; 
    end
end

clear -regexp ^train ^test;

end