require 'pry'

p '♭'
p '♯'

c_major = ['C', 'D', 'E', 'F', 'G', 'A', 'B', 'C']

new_scale_pattern = Array.new

# puts "Which Scale?"
# scale = gets.chomp

# Maybe add the ability to go up/down in the scale vs. just up

puts "Beat Count? Please choose between 4, 8, 16, and 32."
beat_count = gets.chomp

# C Major would be the selected scale
length = c_major.length

length.times do
  # Find a random value in the array
  index_position = rand(0..length)

  # Add that random value to the new array
  new_scale_pattern << c_major[index_position]
end

# Print the new array
p new_scale_pattern