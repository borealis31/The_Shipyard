function [shipList, contList] = shipLoading(inputShipList, inputContList)
% This function uses the input ship and container lists to load the ships
% based on established properties of the objects
numShip = numel(inputShipList);

% Verify datatypes of input data and return an error if necessary
if ~isa(inputShipList,'ship')
    warndlg(['SHIP LOADING ERROR: sLE01' newline 'Invalid ship array datatype'],'sLE01');
end
if ~isa(inputContList,'container')
    warndlg(['SHIP LOADING ERROR: sLE02' newline 'Invalid container array datatype'],'sLE02');
end

% Runs once for each ship in the ship array
for shipIdx = 1:numShip
    
    % Pulls information for current ship
    curShip = inputShipList(shipIdx);
    
    % Initialize sorted container arrays
    sortedCompContsA = container.empty(0,1);
    sortedCompContsB = container.empty(0,1);
    sortedCompContsC = container.empty(0,1);
    sortedCompContsD = container.empty(0,1);
    
    % Establish index for container in container array
    contCounter = 1;
    
    % Create logical arrays for the different things we need to compare to
    % discover the containers that we can put on the ship
    catCompArray = shipCategoryCompatability(curShip,inputContList);
    weightCompArray = [inputContList.weight] <= curShip.maxWeight;
    destCompArray = strcmp(curShip.destination,{inputContList.destination});
    loadedCompArray = ~[inputContList.isLoaded];
    overallCompArray = catCompArray & weightCompArray & destCompArray & loadedCompArray;
    
    % Pull the containers from the list using the logical arrays
    compatibleContainers = inputContList(overallCompArray);
    
    % Sort compatible arrays by category using the weight of each
    sortedCompContsA = contMergeSort(compatibleContainers(strcmp({compatibleContainers.category},'A')),'weight');
    if strcmp(curShip.category,'B') || strcmp(curShip.category,'C') || strcmp(curShip.category,'D')
       sortedCompContsB = contMergeSort(compatibleContainers(strcmp({compatibleContainers.category},'B')),'weight');
    end
    if strcmp(curShip.category,'C') || strcmp(curShip.category,'D')
       sortedCompContsC = contMergeSort(compatibleContainers(strcmp({compatibleContainers.category},'C')),'weight');
    end
    if strcmp(curShip.category,'D')
       sortedCompContsD = contMergeSort(compatibleContainers(strcmp({compatibleContainers.category},'D')),'weight');
    end
    
    % Merge the categorically sorted arrays in order of array precedence
    % (D>C>B>A)
    sortedCompConts = horzcat(sortedCompContsD, sortedCompContsC, sortedCompContsB, sortedCompContsA);
    
    % Assign container to ship and record in both the ship and container
    % objects while the number of containers is below maximum capacity
    while (curShip.capacity > numel(curShip.loadedContainers)) && (contCounter <= (numel(sortedCompConts)))
        curShip.loadedContainers{contCounter} = sortedCompConts(contCounter).ID;
        contIdx = find(strcmp({inputContList.ID},sortedCompConts(contCounter).ID));
        inputContList(contIdx).isLoaded = true;
        inputContList(contIdx).onShip = curShip.ID;
        contCounter = contCounter + 1;
    end
    
    % Push current ship values to the slot the original values came from
    inputShipList(shipIdx) = curShip;
    
    % Push the container and ship lists to the output variables
    contList = inputContList;
    shipList = inputShipList;
end
end

% Create the logical array using categories
function compArray = shipCategoryCompatability(inputShip, inputContList)
% Determine the containers that have compatible categories with a given
% ship

% Default categories
acceptableCategories = {'D','C','B','A'};

% Remove incompatible categories
if inputShip.category == 'C'
    acceptableCategories(1) = [];
elseif inputShip.category == 'B'
    acceptableCategories(1:2) = [];
elseif inputShip.category == 'A'
    acceptableCategories(1:3) = [];
end

% Initialize output logic array
compArray = zeros(1,numel(inputContList));

% Create logical array by using or compatibility with other category labels
for catIdx = 1:numel(acceptableCategories)
    compArray = compArray | strcmp(acceptableCategories{catIdx},{inputContList.category});
end
end

