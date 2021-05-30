function [sortedMergedContList] = contMergeSort(inputContList, inputQuality)
% Recursive merge sort function that will sort a list of containers
% by weight or ID
numCL = numel(inputContList);

if ~isa(inputContList,'container')
    warndlg(['CONTAINER MERGE SORT ERROR: cMSE01' newline 'Invalid array datatype'],'cMSE01');
end
% If there's only one element, return it
if numCL <= 1
    sortedMergedContList = inputContList;
    return
end

% Midpoint of the countainer array
midPT = floor(numCL/2);

% Sends the left half of the container arry back through the function
outList1 = contMergeSort(inputContList(1:midPT),inputQuality);

% Sends the right half of the container array back through the function
outList2 = contMergeSort(inputContList(midPT+1:numCL),inputQuality);

% Calls the merge command
sortedMergedContList = contMerge(outList1,outList2,inputQuality);
end

function [mergedContList] = contMerge(inputContList1,inputContList2,inputQuality)
% Merges two lists of containers based on weight of each entry
numC1 = numel(inputContList1);
numC2 = numel(inputContList2);
mergedContList = container.empty(0,numC1 + numC2);
cLIdx1 = 1;
cLIdx2 = 1;
cLIdxO = 1;

% Detmine the nature of the sort and the order of values to be returned to the new merged array
if strcmp(inputQuality,'weight')
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
elseif strcmp(inputQuality,'id')
    while (cLIdx1 < numC1+1) && (cLIdx2 < numC2+1)
        entry1 = str2double(inputContList1(cLIdx1).ID(2:end));
        entry2 = str2double(inputContList2(cLIdx2).ID(2:end));
        if entry1 <= entry2
            mergedContList(cLIdxO) = inputContList1(cLIdx1);
            cLIdx1 = cLIdx1 + 1;
        else
            mergedContList(cLIdxO) = inputContList2(cLIdx2);
            cLIdx2 = cLIdx2 + 1;
        end
        cLIdxO = cLIdxO + 1;
    end
else
    warndlg(['CONTAINER MERGE SORT ERROR: cMSE02' newline 'Invalid merge type'],'cMSE02');
end


% If there are remaining elements from input 1, put them into the new merged array
while cLIdx1 < numC1+1
    mergedContList(cLIdxO) = inputContList1(cLIdx1);
    cLIdxO = cLIdxO + 1;
    cLIdx1 = cLIdx1 + 1;
end

% If there are remaining elements from input 2, put them into the new merged array
while cLIdx2 < numC2+1
    mergedContList(cLIdxO) = inputContList2(cLIdx2);
    cLIdxO = cLIdxO + 1;
    cLIdx2 = cLIdx2 + 1;
end

end