#Defining the constants for input commands
FORWARD = "F"
BACKWARD = "B"
RIGHT = "R"
LEFT = "L"

=begin
Setting the initial (x,y) coordinates of the Robot to (0,0)
and the initial direction to 0 (facing positive y-axis)
=end
x,y = 0
direction = 0

#General instructions to users about the Robots Behaviour
def instructions
    puts "\n\t\t<------Instructions------>"
    puts "Control the robot's behaviour with a series of `<command><number>` pair"
    puts "Use comma(,) to separate each pairs"
    puts "The robot accepts the following commands:"
    puts "\t* `F` - move forward by 1 unit"
    puts "\t* `B` - move backward by 1 unit"
    puts "\t* `R` - turn right by 90 degree"
    puts "\t* `L` - turn left by 90 degree\n"
    puts "The numbers specify the magnitude of the motion or rotation"
    puts "For eg., 'L2' means turn left by 180(2 times 90) degrees"
    puts "\t 'B3' means move backwards by 3 units"
    puts "Sample Command: F1,R2,B2,L1,B3"
end



def handleCommands(commands)   
    begin
        list = commands.split(",")
        list.each do |command|
        end
    puts list[0]        
    rescue => exception
        
    end
end





#Start point of the application
puts "------------------------------------------------------------"
puts "|\t\tWelcome to Robot Controller                |"
puts "|\tYou can exit the application by typing `x`         |"
puts "|\tYou can display instructions by typing `i`         |"
puts "------------------------------------------------------------"
instructions

loop do
    puts "Please enter your commands to control the robot"
    option = gets.chomp
    case option
    when "x"
        break
    when "i"
        instructions
    else
        handleCommands(option)
    end
    break if option.downcase=="x"
end

