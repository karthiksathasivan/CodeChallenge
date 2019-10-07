
# Defining the constants for input commands
# Please define values in caps while extending/modifying in future
FORWARD = "F"
BACKWARD = "B"
RIGHT = "R"
LEFT = "L"

# Defining all possible commands available for regular expression
COMMANDS = [FORWARD,BACKWARD,RIGHT,LEFT]
MOVEMENT_COMMANDS = [FORWARD,BACKWARD]

=begin
Setting the initial (x,y) coordinates of the Robot to (0,0)
and the current(initial) direction to 0 (facing positive y-axis)
=end
$x = 0
$y = 0
$current_direction = 0

=begin
Method to handle the robot control command entered by user
Validate the input:
- If failed return to the main function
- Else pass the control to respective function
Once the functions are executed print the result
=end
def command_handler(input)  
    list = input.split(",")
    list.each do |instruction|  
        instruction = instruction.upcase.gsub(/\s+/, "")
        if !(/^([a-zA-Z]+)([0-9]+)$/.match?(instruction))
            puts "\nInvalid input command. Please type `i` to refer to the instructions"
            return
        end        
        command = instruction[0..(instruction.index(/\d/)-1)].upcase
        if COMMANDS.include? command            
            unit = instruction[(instruction.index(/\d/))..(instruction.length-1)].to_i
            (MOVEMENT_COMMANDS.include? command)? move_robot(command, unit) : rotate_robot(command, (unit % 4))
        else
            puts "\nInvalid input command. Please type `i` to refer to the instructions"
            return
        end           
    end
    puts "\n[------ Minimum distance to origin is `#{$x.abs() + $y.abs()}` ------]"
    $x = 0
    $y = 0
    $current_direction = 0
end

# Method to check current_direction and move robot `unit` times
def move_robot(command, unit)
    if /#{FORWARD}/.match?(command)
        case $current_direction 
        when 0
            $y += unit
        when 1
            $x += unit
        when 2
            $y -= unit
        else
            $x -= unit
        end
    elsif /#{BACKWARD}/.match?(command)
        case $current_direction 
        when 0
            $y -= unit
        when 1
            $x -= unit
        when 2
            $y += unit
        else
            $x += unit
        end            
    end             
end

# Method to rotate the robot `unit` times and update the current_direction
def rotate_robot(command, unit)
    if /#{RIGHT}/.match?(command)
        case unit
        when 1
            $current_direction += 1
        when 2
            $current_direction += 2
        when 3
            $current_direction += 3
        else
            $current_direction += 0
        end
    elsif /#{LEFT}/.match?(command)
        case unit
        when 1
            $current_direction += 3
        when 2
            $current_direction += 2
        when 3
            $current_direction += 1
        else
            $current_direction += 0
        end
    end
    $current_direction %= 4
end

# General instructions to users about the commands to control Robot's Behaviour
def instructions
    puts "\n\t\t   <------Instructions------>"
    puts "You can control the robot with a series of `<command><number>` pair"
    puts "Use comma(,) to separate the pairs"
    puts "The robot accepts the following commands:"
    puts "\t* `#{FORWARD}` - move forward by 1 unit"
    puts "\t* `#{BACKWARD}` - move backward by 1 unit"
    puts "\t* `#{RIGHT}` - turn right by 90 degree"
    puts "\t* `#{LEFT}` - turn left by 90 degree\n"
    puts "The numbers specify the unit of motion or rotation"
    puts "For eg., '#{LEFT}2' means turn left by 180(2 times 90) degrees"
    puts "\t '#{BACKWARD}3' means move backwards by 3 units"
    puts "Sample Command: #{FORWARD}1,#{RIGHT}1,#{BACKWARD}2,#{LEFT}1,#{BACKWARD}3"
end

# Starting point of the application
puts "\t-----------------------------------------------------------"
puts "\t|\t\tWelcome to Robot Controller               |"
puts "\t|\tYou can exit the application by entering `x`      |"
puts "\t|\tYou can display instructions by entering `i`      |"
puts "\t-----------------------------------------------------------"
instructions

# Get user input till the user wishes to exit
loop do
    puts "\nPlease enter your input"
    user_input = gets.chomp
    case user_input
    when "x"
        puts "Thank you for your time. Have a good day!"
        break
    when "i"
        instructions
    else
        command_handler(user_input)
    end
    break if user_input.upcase == "X"
end

