classdef container
%     This is the file containing the properties and functions
%     involved with the creation of a "container"
%       
%      There are several properties involved with this:
%      -Store Tag: Container equivalent to the ship's call-tag. Defines the
%       properties of the container (category, weight, and destination)
%      -ID: Identifiable ID of the container involved
%      -Catgeory: Type of contents/container involved
%      -Weight: Weight of the container
%      -Destination: Where the container is heading
    
    properties (Access = public)
        ID;
        category;
        weight;
        destination;
        onShip;
        isLoaded;
    end
    
    properties (Access = private)
        storeTag;
    end
    
    methods
        %Initializing function
        function obj = container(inputInformation)
            for assignIdx = 1:numel(inputInformation)
                if assignIdx == 1
                    obj.storeTag = inputInformation{assignIdx};
                else
                    warndlg(['CONTAINER ERROR: cE01' newline 'Invalid constructor input'],'cE01');
                    break;
                end
            end
            obj = contAttribSet(obj,obj.storeTag);
        end
        
        %Attribute-setting function called by initializer
        function obj = contAttribSet(obj,inputStoreTag)
            obj.onShip = NaN;
            obj.isLoaded = false;
            
            attributes = strsplit(inputStoreTag,'-');
            
            if numel(attributes) < 4
                warndlg(['CONTAINER ERROR: cE02' newline 'Invalid number of elements in call-tag (LOW)'],'cE02');
                counter = 1;
                while numel(attributes) < 4 && counter < 10
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
                    obj.weight = str2double(attributes{attribIdx});
                elseif attribIdx == 4
                    obj.destination = attributes{attribIdx};
                else
                    warndlg(['CONTAINER ERROR: cE03' newline 'Invalid number of elements in call-tag (HIGH)'],'cE03');
                    
                    break;
                end
            end

            if strcmp(obj.ID,'') || nnz(isnan(obj.ID)) ~= 0
                warndlg(['CONTAINER ERROR: cE04' newline 'Missing call-tag ID'],'cE04');
            end
            if strcmp(obj.category, '') || isnan(obj.category)
                obj.category = 'MISSING';
                warndlg(['CONTAINER ERROR: cE05' newline 'Missing call-tag category'],'cE05');
            end
            if strcmp(obj.weight,'') || isnan(obj.weight)
                obj.weight = 'MISSING';
                warndlg(['CONTAINER ERROR: cE06' newline 'Missing call-tag weight'],'cE06');
            end
            if strcmp(obj.destination,'') || nnz(isnan(obj.destination)) ~= 0
                obj.capacity = 'MISSING';
                warndlg(['CONTAINER ERROR: cE07' newline 'Missing call-tag destination'],'cE07');
            end
        end
    end
end

