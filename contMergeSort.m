function [sortedMergedContList] = contMergeSort(inputContList)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
numCL = numel(inputContList);
if numCL <= 1
    sortedMergedContList = inputContList;
    return
end
midPT = floor(numCL/2);
outList1 = contMergeSort(inputContList(1:midPT));
outList2 = contMergeSort(inputContList(midPT+1:numCL));
sortedMergedContList = contMerge(outList1,outList2);
end

function [mergedContList] = contMerge(inputContList1,inputContList2)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
    numC1 = numel(inputContList1);
    numC2 = numel(inputContList2);
    mergedContList = container.empty(0,numC1 + numC2);
    cLIdx1 = 1;
    cLIdx2 = 1;
    cLIdxO = 1;
    
    while (cLIdx1 < numC1+1) && (cLIdx2 < numC2+1)
        if inputContList1(cLIdx1).weight <= inputContList2(cLIdx2).weight
            mergedContList(cLIdxO) = inputContList1(cLIdx1);
            cLIdx1 = cLIdx1 + 1;
        else
            mergedContList(cLIdxO) = inputContList2(cLIdx2);
            cLIdx2 = cLIdx2 + 1;
        end
        cLIdxO = cLIdxO + 1;
    end
    
    while cLIdx1 < numC1+1
        mergedContList(cLIdxO) = inputContList1(cLIdx1);
        cLIdxO = cLIdxO + 1;
        cLIdx1 = cLIdx1 + 1;
    end

    while cLIdx2 < numC2+1
        mergedContList(cLIdxO) = inputContList2(cLIdx2);
        cLIdxO = cLIdxO + 1;
        cLIdx2 = cLIdx2 + 1;
    end
    
end