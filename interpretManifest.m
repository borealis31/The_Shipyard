function [shipList,contList] = interpretManifest(inputManifest)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
if isa(inputManifest, 'manifest') && numel(inputManifest) ~= 0
    shipList = ship.empty(0,numel(inputManifest.shipTagList));
    contList = container.empty(0,numel(inputManifest.contTagList));
    for shipIdx = 1:size(shipList,2)
        shipList(shipIdx) = ship(inputManifest.shipTagList(shipIdx));
    end
    for contIdx = 1:size(contList,2)
        contList(contIdx) = container(inputManifest.contTagList(contIdx));
    end
    clear  shipIdx contIdx
elseif isa(inputManifest, 'manifest') && numel(inputManifest) == 0
    warndlg(['INTERPRET MANIFEST ERROR: iME01' newline 'No elements in manifest'],'iME01');
else
    warndlg(['INTERPRET MANIFEST ERROR: iME02' newline 'Invalid Data-type'],'iME02');
end
end

