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


# print "Wanted to see if you were here today! yes/no? "

# loop {  here = gets.chomp
#   case here
#   when 'q','quit','exit'
#     exit
#   when 'yes','y'
#     puts "sweet! What time is good for you?"
#     time = gets.chomp
#     puts "Right on, I'll see you at #{time}!!"
#     break
#   when 'no','n'
#     puts "Sad. Next week it is!"
#     break
#   else
#     puts "That does not compute! yes/no?"
#   end
# }


# class Here

#   print "Wanted to see if you were here today! yes/no? "

#   def handle_yes
#   puts "sweet! What time is good for you?"
#   time = gets.chomp
#   puts "Right on, I'll see you at #{time}!!"
#   end
  
#   def handle_no
#   puts "Sad. Next week it is!"
#   end
  
#   def handle_maybe
#   puts "Maybe, eh? Just let me know when is good for you!"
#   end
  
#   def handle_quit
#   puts "Goodbye"
#   end
  
#   while input = gets.chomp.upcase
#     break handle_yes if %w[YES Y].include?(input)
#     break handle_no if %w[N NO].include?(input)
#     break handle_maybe if %w[MAYBE].include?(input)
#     break handle_quit if %w[Q QUIT EXIT].include?(input)
#     puts "That does not compute! Try again: yes/no? "
#   end
# end
  
print "Wanted to see if you were here today! yes/no? "
 
def handle_yes
  puts "sweet! What time is good for you?"
  time = gets.chomp
  puts "Right on, I'll see you at #{time}!!"
end
 
def handle_no
  puts "Sad. Next week it is!"
end
 
def handle_maybe
  puts "Maybe, eh? Just let me know when is good for you!"
end
 
def handle_quit
  puts "Goodbye"
end
 
matchers = {
  yes:   %w[YES Y],
  no:    %w[NO  N],
  maybe: %w[MAYBE],
  quit:  %w[Q QUIT EXIT]
}
 
while input = gets.chomp.upcase
  if match = matchers.find { |_, matches| matches.include? input }
    break send "handle_#{match.first}"
  end
  puts "That does not compute! Try again: yes/no? "
end