#Defining the constants for input commands
FORWARD = "F"
BACKWARD = "B"
RIGHT = "R"
LEFT = "L"

=begin
Setting the initial (x,y) coordinates of the Robot to (0,0)
and the current(initial) direction to 0 (facing positive y-axis)
=end
$x = 0
$y = 0
$current_direction = 0

#General instructions to users about the Robots Behaviour
def instructions
    puts "\n\t\t   <------Instructions------>"
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


def command_handler(commands)  
    list = commands.split(",")
    list.each do |command|          
        if !(/^([#{FORWARD}#{BACKWARD}#{RIGHT}#{LEFT}])([0-9]+)$/.match?(command.upcase)) 
            puts "\nInvalid input command please check the instructions if you are unsure"
            return 
        else
            direction = command[0].upcase   
            unit = command[1, command.length-1].to_i  
            if /^[#{FORWARD}#{BACKWARD}]$/.match?(direction)
                move_robot(direction, unit)  
            else
                rotate_robot(direction, (unit % 4)) 
            end           
        end       
    end
    min_distance = $x.abs() + $y.abs()
    puts "\nMinimum distance to origin is #{min_distance}"
    $x = 0
    $y = 0
    $current_direction = 0
end


def move_robot(direction, unit)  
    if $current_direction == 0
        if /#{FORWARD}/.match?(direction)
            $y += unit
        else
            $y -= unit
        end
    elsif $current_direction == 1
        if /#{FORWARD}/.match?(direction)
            $x += unit
        else
            $x -= unit
        end
    elsif $current_direction == 2
        if /#{FORWARD}/.match?(direction)
            $y -= unit
        else
            $y += unit
        end
    else
        if /#{FORWARD}/.match?(direction)
            $x -= unit
        else
            $x += unit
        end
    end              
end


def rotate_robot(direction, unit)
    if unit == 1
        if /#{RIGHT}/.match?(direction)
            $current_direction += 1
        else
            $current_direction += 3
        end
    elsif unit == 2
        $current_direction += 2
    elsif unit == 3
        if /#{RIGHT}/.match?(direction)
            $current_direction += 3
        else
            $current_direction += 1
        end
    else
        $current_direction += 0
    end
    $current_direction %= 4
end


#Start point of the application
puts "-----------------------------------------------------------"
puts "|\t\tWelcome to Robot Controller               |"
puts "|\tYou can exit the application by typing `x`        |"
puts "|\tYou can display instructions by typing `i`        |"
puts "-----------------------------------------------------------"
instructions

loop do
    puts "\nPlease enter your input"
    option = gets.chomp
    case option
    when "x"
        puts "Thank you for your time. Have a good day!"
        break
    when "i"
        instructions
    else
        command_handler(option)
    end
    break if option.downcase == "x"
end

