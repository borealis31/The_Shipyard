classdef ship
%     This is the file containing the properties and functions
%     involved with the creation of a "ship"
%     
%     There are several properties involved with this:
%     -ID: This is the identifier of the ship when available (OPTIONAL)
%     -Manufacturer: If provided, this is an additional identifier
%      (OPTIONAL)
%     -Call Tag: This is a string of values that contains vital information
%      about the properties of the ship, such as maximum load, container
%      category, and capacity (REQUIRED)
%     -Maximum Load: The most (in weight), each container can be (REQUIRED)
%     -Container Category: There exist various types of containers; not all
%      ships can container all types of containers (type A can carry type
%      A, type B cand carry type A and B, so on and so forth) (REQUIRED)
%     -Capacity: The highest number of containers a ship can carry 
%      (REQUIRED)

    properties (Access = public)
        ID;
        category;
        maxWeight;
        capacity;
        destination;
        loadedContainers;
    end
    
    properties (Access = private)
        callTag;
    end
    
    methods
        function obj = ship(inputInformation)
            %Construct an instance of this class
            %Decipher properties from passed callTag (predetermined order)
            obj.loadedContainers = container.empty([0,0]);
            
            for assignIdx = 1:numel(inputInformation)
                if assignIdx == 1
                    obj.callTag = inputInformation{assignIdx};
                else
                    warndlg(['SHIP ERROR: sE01' newline 'Invalid constructor input'],'sE01');
                    break;
                end
            end
            obj = shipAttribSet(obj,obj.callTag);
        end
        
        function obj = shipAttribSet(obj,inputCallTag)
            attributes = strsplit(inputCallTag,'-');
            
            if numel(attributes) < 5
                warndlg(['SHIP ERROR: sE02' newline 'Invalid number of elements in call-tag (LOW)'],'sE02');
                counter = 1;
                while numel(attributes) < 5 && counter < 10
                     attributes{end+1} = '';
                     counter = counter + 1;
                end
            end
            
            for attribIdx = 1:numel(attributes)
                if attribIdx == 1
                    obj.ID = upper(attributes{attribIdx});
                elseif attribIdx == 2
                    obj.category = upper(attributes{attribIdx});
                elseif attribIdx == 3
                    obj.maxWeight = str2double(attributes{attribIdx});
                elseif attribIdx == 4
                    obj.capacity = str2double(attributes{attribIdx});
                elseif attribIdx == 5
                    obj.destination = upper(attributes{attribIdx});
                else
                    warndlg(['SHIP ERROR: sE03' newline 'Invalid number of elements in call-tag (HIGH)'],'sE03');
                end
            end
            
            if strcmp(obj.ID,'') || nnz(isnan(obj.ID)) ~= 0
                obj.ID = 'MISSING';
                warndlg(['SHIP ERROR: sE04' newline 'Missing call-tag ID'],'sE04');
            end
            if strcmp(obj.category,'') || isnan(obj.category)
                obj.category = 'MISSING';
                warndlg(['SHIP ERROR: sE05' newline 'Missing call-tag category'],'sE05');
            end
            if strcmp(obj.maxWeight,'') || isnan(obj.maxWeight)
                obj.maxWeight = 'MISSING';
                warndlg(['SHIP ERROR: sE06' newline 'Missing call-tag maxWeight'],'sE06');
            end
            if strcmp(obj.capacity,'') || isnan(obj.capacity)
                obj.capacity = 'MISSING';
                warndlg(['SHIP ERROR: sE07' newline 'Missing call-tag capacity'],'sE07');
            end
            if strcmp(obj.destination,'') || nnz(isnan(obj.destination)) ~= 0
                obj.destination = 'MISSING';
                warndlg(['SHIP ERROR: sE08' newline 'Missing call-tag destination'],'sE08');
            end
        end
        
       
    end
end

