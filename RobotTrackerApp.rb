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
    puts "\t* `#{FORWARD}` - move forward by 1 unit"
    puts "\t* `#{BACKWARD}` - move backward by 1 unit"
    puts "\t* `#{RIGHT}` - turn right by 90 degree"
    puts "\t* `#{LEFT}` - turn left by 90 degree\n"
    puts "The numbers specify the magnitude of the motion or rotation"
    puts "For eg., '#{LEFT}2' means turn left by 180(2 times 90) degrees"
    puts "\t '#{BACKWARD}3' means move backwards by 3 units"
    puts "Sample Command: #{FORWARD}1,#{RIGHT}2,#{BACKWARD}2,#{LEFT}1,#{BACKWARD}3"
end



def move_robot(commands)  
    list = commands.split(",")
    list.each do |command|          
        if !(/^([#{FORWARD}#{BACKWARD}#{RIGHT}#{LEFT}])([0-9]+)$/.match?(command.upcase)) 
            puts "Invalid input format please check the instructions"
            break 
        else
            puts command[0]   
            puts command[1, command.length-1]        
        end       
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
    puts "Please enter your input"
    option = gets.chomp
    case option
    when "x"
        break
    when "i"
        instructions
    else
        move_robot(option)
    end
    break if option.downcase=="x"
end

