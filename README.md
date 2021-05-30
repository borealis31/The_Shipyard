# The_Shipyard

## Summary
The_Shipyard is a foray into object-oriented programming that explores things such as file in/out, classes, and recursive functions. It was prototyped and tested in MATLAB Scripting Language, and I have plans to rewrite it in C++. The MATLAB code has complete documentation and error detection for invalid inputs that may or may not be impactful to the code. If you have any questions on how it works, feel free to email me at jakeb.chouinard@gmail.com.

In a more conceptual sense, this code is designed to take in a .txt file containing a mixture of ship and container "call-tags". It then sorts these call-tags through the creation of a manifest. The manifest is then interpreted to create ship and container objects depending on the attributes of the parsed call-tags. This outputs a list of ships as well as a list of containers. Using these lists, they are then parsed through a loading function. This loading function uses the properties of each ship to match them with containers that are compatible. The containers are prioritized by weight using a recursive merge sort function. Ships accrue containers, and the ship on which a container is will be recorded in the container's properties. The list of containers is then sorted by container ID. Container IDs are then output in a cell array that is horizontally concatenated with a cell array containing the IDs of the ships they are loaded onto ([See example output](https://github.com/borealis31/The_Shipyard/blob/main/matlab/exampleOutput.PNG)).

## Contents
### MATLAB Scripts
#### Classes
There exist 3 different classes created for this project. The descriptions can be found in their respective .m files as well as below:
  - Ship
    - This is the file containing the properties and functions involved with the creation of a "ship". There are several properties involved with this:
      - Call Tag: This is a string of values that contains vital information about the properties of the ship, such as maximum load, container category, and capacity
        - Ex. SXXX-Y-WW-CC-DD
          - Where XXX = ID, Y = Category, WW = Max Weight, CC = Capacity, DD = Destination
      - ID: This is the identifier of the ship
      - Container Category: There exist various types of containers; not all ships can container all types of containers (type A can carry type A, type B can carry type A and B, so on and so forth)
      - Maximum Load: The most (in weight), each container can be
      - Capacity: The highest number of containers a ship can carry
      - Destination: The 2-character code that indicates where the ship is heading
      - Loaded Containers: This is a cell array of char-type arrays that eventually contains the ID of every container loaded onto the ship
  - Container
    - This is the file containing the properties and functions involved with the creation of a "container". There are several properties involved with this:
      - Store Tag: Container equivalent to the ship's call-tag. Defines the properties of the container (category, weight, and destination)
        - Ex. CXXX-Y-WW-DD
          - Where XXX = ID, Y = Category, WW = Weight, DD = Destination
      - ID: Identifiable ID of the container involved
      - Catgeory: Type of contents/container involved
      - Weight: Weight of the container
      - Destination: Where the container is heading
      - On Ship: This is a char array that contains the ID of the ship is eventually loaded onto
  - Manifest
    - This is the file that contains the declaration of the "maifest". This declaration parses a file name in order to create and sort a list of ship and container call tags

#### Functions
  - interpretManifest
    - Uses the initialized manifest from the live script to create a list of ships and a list of containers
  - contMergeSort
    - Recursive merge sort function that will sort a list of containers by weight or ID
  - shipLoading
    - This function uses the input ship and container lists to load the ships based on established properties of the objects
  - set/getGlobalVariables
    - This set of functions is not actually used in the example output. It was initially designed to avoid needing to output the ship and container lists repeatedly, but it was decided against being used 
