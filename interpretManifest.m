function [shipList,contList] = interpretManifest(inputManifest)
    % Uses the initialized manifest from the live script to create
    % a list of ships and a list of containers
    if isa(inputManifest, 'manifest') && numel(inputManifest) ~= 0
        
        % Creates empty ship and container arrays of maximum size for efficiency
        shipList = ship.empty(0,numel(inputManifest.shipTagList));
        contList = container.empty(0,numel(inputManifest.contTagList));
        
        % Populates the ship array with initialized ship objects
        for shipIdx = 1:size(shipList,2)
            shipList(shipIdx) = ship(inputManifest.shipTagList(shipIdx));
        end
        
        % Populates the container array with initialized container objects
        for contIdx = 1:size(contList,2)
            contList(contIdx) = container(inputManifest.contTagList(contIdx));
        end
        
    % Checks for an empty manifest
    elseif isa(inputManifest, 'manifest') && numel(inputManifest) == 0
        warndlg(['INTERPRET MANIFEST ERROR: iME01' newline 'No elements in manifest'],'iME01');
    
    % Checks that the input is actually a manifest object
    else
        warndlg(['INTERPRET MANIFEST ERROR: iME02' newline 'Invalid Data-type'],'iME02');
    end
end

