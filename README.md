# Code Test - Robot Tracker
## Ruby Application
 Ruby program to track a robot, which receives simple input commands to move in a 2-Dimensional space. 
 The goal of the application is to track the robot's movement and find the minimum distance it must travel to reach the origin

 ### Available commands:
* `F` - move forward 1 unit
* `B` - move backward 1 unit
* `R` - turn right 90 degrees
* `L` - turn left 90 degrees

### Sample Input and Output to test the app
Input/Output Endpoint: - Console

Inputs: - a string of comma-separated commands eg `F1,R1,B2,L1,B3`

Output: - the minimum amount of distance to get back to the starting point (`4` in this case)

### Instructions to install and execute the application
#### Note: You might need latest ruby version, which can be found here https://rubyinstaller.org/downloads/
* Clone the repository
* Open Command prompt/Terminal and `cd` to the repository
* Run  `ruby RobotTrackerApp.rb`

### Design Assumptions and Decisions
* The robot's movement can be tracked on a 2-Dimensional plane using x,y-axes and current direction (using integers - 0,1,2,3)
* The initial displacement can be assigned to (0,0) [(x,y) coordinates]
* The initial direction can be assigned 0(facing positive y-axis)
* The program will only accept input in the form `<command><number>`.All other commands (eg., `F,R,...`) will be invalidated using regex.


