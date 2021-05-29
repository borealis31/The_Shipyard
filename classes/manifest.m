classdef manifest
    %   This is the file that contains the declaration of the "maifest"
    %
    %   This declaration parses a file name in order to create and sort
    %   a list for of ship and container call tags
    
    properties (Access = public)
        contTagList;
        shipTagList;
    end
    
    methods
        function obj = manifest(fileName)
            %MANIFEST Construct an instance of this class
            %   Uses objSort to turn cell array of tags into cell arrays
            %   of container and ship tag arrays
            loadedObjects = regexp(fileread(fileName), '\r?\n', 'split');
            obj.contTagList = {};
            obj.shipTagList = {};
            obj = objSort(obj, loadedObjects);
        end
        
        function obj = objSort(obj, loadedObjects)
            %   Manipulates unsorted loadedObjects list of tags
            %   to produce two lists of tags
            for objIdx = 1:numel(loadedObjects)
                tempVar = loadedObjects{objIdx};
                if ~isempty(tempVar)
                    if tempVar(1) == 'C'
                        obj.contTagList(end+1) = {tempVar};
                    elseif tempVar(1) == 'S'
                        obj.shipTagList(end+1) = {tempVar};
                    else
                        warndlg(['MANIFEST ERROR: mE01' newline 'Invalid call-tag ID'],'mE01');
                    end
                end
            end
        end
    end
end

