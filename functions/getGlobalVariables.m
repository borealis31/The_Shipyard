function [outputManifest,outputShipList,outputContList] = getGlobalVariables()
%GETGLOBALVARIABLES Summary of this function goes here
%   Detailed explanation goes here
global globManifest globShipList globContList
outputManifest = globManifest;
outputShipList = globShipList;
outputContList = globContList;
end

