function shipList = shipLoading(inputShipList, inputContList)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
numShip = numel(inputShipList);
for shipIdx = 1:numShip
    curShip = inputShipList(shipIdx);
    counter = 0;
    comparisonArray = double(strcmp(curShip.category,{inputContList.category})) + double([inputContList.weight] <= curShip.maxWeight) + double(strcmp(curShip.destination,{inputContList.destination}));
    comparisonArray = logical(floor(comparisonArray/max(comparisonArray)));
    compatibleContainers = inputContList(comparisonArray)

    while (curShip.capacity > numel(curShip.loadedContainers)) && (counter < (curShip.capacity + 10))
        
        counter = counter + 1;
    end
end
end

