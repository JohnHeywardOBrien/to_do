#!/usr/bin/env ruby

# print "Yo! Wanted to see if you were here today! yes/no? "
# here = gets.chomp

# if here == "yes"
#   puts "sweet! What time is good for you?"
#   time = gets.chomp
#   puts "Right on, I'll see you at #{time}!!"
# elsif here == "no"
#   puts "Sad. Next week it is!"
# else
#   puts "That does not compute!"
# end


print "Wanted to see if you were here today! yes/no? "

loop {
  here = gets.chomp
  case here
  when 'q','quit','exit'
    exit
  when 'yes','y'
    puts "sweet! What time is good for you?"
    time = gets.chomp
    puts "Right on, I'll see you at #{time}!!"
    break
  when 'no','n'
    puts "Sad. Next week it is!"
    break
  else
    puts "That does not compute! yes/no?"
  end
}



