# The_Shipyard

## Summary
The_Shipyard is a foray into object-oriented programming that explores things such as file in/out, classes, and recursive functions. It was prototyped and tested in MATLAB Scripting Language, and I have plans to rewrite it in C++. The MATLAB code has complete documentation and error detection for invalid inputs that may or may not be impactful to the code. If you have any questions on how it works, feel free to email me at jakeb.chouinard@gmail.com.
## Contents
### MATLAB Scripts
#### Classes
There exist 3 different classes created for this project. The descriptions can be found in their respective .m files as well as below:
  - Ship
    - This is the file containing the properties and functions involved with the creation of a "ship". There are several properties involved with this:
      - Call Tag: This is a string of values that contains vital information
      - ID: This is the identifier of the ship when available
      - Container Category: There exist various types of containers; not all ships can container all types of containers (type A can carry type A, type B can carry type A and B, so on and so forth)
%      about the properties of the ship, such as maximum load, container
%      category, and capacity
%     -Maximum Load: The most (in weight), each container can be
%     -Capacity: The highest number of containers a ship can carry
%     -Destination: The 2-character code that indicates where the ship is
%     heading
  - Container

  - Manifest

#### Functions

  - interpretManifest

  - contMergeSort

  - shipLoading

  - set/getGlobalVariables
