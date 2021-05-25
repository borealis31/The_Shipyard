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
        maxLoad;
        category;
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
            for assignIdx = 1:numel(inputInformation)
                if assignIdx == 1
                    obj.callTag = inputInformation{assignIdx};
                else
                    warndlg('INPUT ERROR: INE01',[obj.ID, ' Warning']);
                    break;
                end
            end
            obj = shipAttribSet(obj,obj.callTag);
        end
        
        function obj = shipAttribSet(obj,inputCallTag)
            attributes = strsplit(inputCallTag,'-');
            
            if numel(attributes) < 5
                warndlg('ATTRIBUTE ERROR: AE01',[obj.ID, ' Warning'])
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
                    obj.maxLoad = str2double(attributes{attribIdx});
                elseif attribIdx == 4
                    obj.capacity = str2double(attributes{attribIdx});
                elseif attribIdx == 5
                    obj.destination = upper(attributes{attribIdx});
                else
                    warndlg('INVALID CALLTAG',[obj.ID, ' Warning']);
                end
            end
            
            if strcmp(obj.ID,'') || nnz(isnan(obj.ID)) ~= 0
                obj.ID = 'MISSING';
                warndlg('ID ERROR: IDE01',[obj.ID, ' Warning']);
            end
            if strcmp(obj.category,'') || isnan(obj.category)
                obj.category = 'MISSING';
                warndlg('CATEGORY ERROR: CTE01',[obj.ID, ' Warning']);
            end
            if strcmp(obj.maxLoad,'') || isnan(obj.maxLoad)
                obj.maxLoad = 'MISSING';
                warndlg('LOAD ERROR: LE01',[obj.ID, ' Warning']);
            end
            if strcmp(obj.capacity,'') || isnan(obj.capacity)
                obj.capacity = 'MISSING';
                warndlg('CAPACITY ERROR: CE01',[obj.ID, ' Warning']);
            end
            if strcmp(obj.destination,'') || nnz(isnan(obj.destination)) ~= 0
                obj.destination = 'MISSING';
                warndlg('DESTINATION ERROR: DE01',[obj.ID, ' Warning']);
            end
        end
        
       
    end
end

