classdef container
%     This is the file containing the properties and functions
%     involved with the creation of a "container"
%       
%      There are several properties involved with this:
%      -ID: Identifiable ID of the container involved
%      -Catgeory: Type of contents/container involved
%      -Weight: Weight of the container
%      -Destination: Where the container is heading
%      -Store Tag: Container equivalent to the ship's call-tag. Defines the
%       properties of the container (category, weight, and destination)

    
    properties (Access = public)
        ID;
        category;
        weight;
        destination;
        onShip;
    end
    
    properties (Access = private)
        storeTag;
    end
    
    methods
        function obj = container(inputInformation)
            for assignIdx = 1:numel(inputInformation)
                if assignIdx == 1
                    obj.storeTag = inputInformation{assignIdx};
                else
                    warndlg('INPUT ERROR: INE02',[obj.ID, ' Warning']);
                    break;
                end
            end
            obj = contAttribSet(obj,obj.storeTag);
        end
        
        function obj = contAttribSet(obj,inputStoreTag)
            attributes = strsplit(inputStoreTag,'-');
            
            if numel(attributes) < 4
                warndlg('ATTRIBUTE ERROR: AE02',[obj.ID, ' Warning'])
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
                    warndlg('INVALID STORETAG',[obj.ID, ' Warning']);
                    break;
                end
            end

            if strcmp(obj.ID,'') || nnz(isnan(obj.ID)) ~= 0
                warndlg('ID ERROR: IDE02',[obj.ID, ' Warning'])
            end
            if strcmp(obj.category, '') || isnan(obj.category)
                obj.category = 'MISSING';
                warndlg('CATEGORY ERROR: CTE02',[obj.ID, ' Warning']);
            end
            if strcmp(obj.weight,'') || isnan(obj.weight)
                obj.maxLoad = 'MISSING';
                warndlg('WEIGHT ERROR: WE02',[obj.ID, ' Warning']);
            end
            if strcmp(obj.destination,'') || nnz(isnan(obj.destination)) ~= 0
                obj.capacity = 'MISSING';
                warndlg('DESTINATION ERROR: DE02',[obj.ID, ' Warning']);
            end
        end
    end
end

