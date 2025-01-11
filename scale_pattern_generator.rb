require 'pry'

puts "Welcome to the Scale Pattern Generator! \n"
puts "\n"
puts "1. C Major = C, D, E, F, G, A, B, C"
puts "2. D Major = D, E, F♯, G, A, B, C♯, D"
puts "3. E Major = E, F♯, G♯, A, B, C♯, D♯, E"
puts "4. F Sharp Major = F♯, G♯, A♯, B, C♯, D♯, E♯, F♯"
puts "5. F Major = F, G, A, B♭, C, D, E, F"
puts "6. E Flat Major = E♭, F, G, A♭, B♭, C, D, E♭"
puts "7. D Flat Major = D♭, E♭, F, G♭, A♭, B♭, C, D♭"
puts "8. G Major = G, A, B, C, D, E, F♯, G"
puts "9. A Major = A, B, C♯, D, E, F♯, F♯, A"
puts "10. B Major = B, C♯, D♯, E, F♯, G♯, A♯, B"
puts "11. C Sharp Major = C♯, D♯, E♯, F♯, G♯, A♯, B♯, C♯"
puts "12. B Flat Major = B♭, C, D, E♭, F, G, A, B♭"
puts "13. A Flat Major = A♭, B♭, C, D♭, E♭, F, G, A♭"
puts "14. G Flat Major = G♭, A♭, B♭, C♭, D♭, E♭, F, G♭"
puts "\n"

puts "Which Scale? Please choose a number between 1 and 14."
user_input_scale = gets.chomp.to_i

if user_input_scale == 1
  scale = ['C', 'D', 'E', 'F', 'G', 'A', 'B', 'C']
elsif user_input_scale == 2
  scale = ['D', 'E', 'F♯', 'G', 'A', 'B', 'C♯', 'D']
elsif user_input_scale == 3
  scale = ['E', 'F♯', 'G♯', 'A', 'B', 'C♯', 'D♯', 'E']
elsif user_input_scale == 4
  scale = ['F♯', 'G♯', 'A♯', 'B', 'C♯', 'D♯', 'E♯', 'F♯']
elsif user_input_scale == 5
  scale = ['F', 'G', 'A', 'B♭', 'C', 'D', 'E', 'F']
elsif user_input_scale == 6
  scale = ['E♭', 'F', 'G', 'A♭', 'B♭', 'C', 'D', 'E♭']
elsif user_input_scale == 7
  scale = ['D♭', 'E♭', 'F', 'G♭', 'A♭', 'B♭', 'C', 'D♭']
elsif user_input_scale == 8
  scale = ['G', 'A', 'B', 'C', 'D', 'E', 'F♯', 'G']
elsif user_input_scale == 9
  scale = ['A', 'B', 'C♯', 'D', 'E', 'F♯', 'F♯', 'A']
elsif user_input_scale == 10
  scale = ['B', 'C♯', 'D♯', 'E', 'F♯', 'G♯', 'A♯', 'B']
elsif user_input_scale == 11
  scale = ['C♯', 'D♯', 'E♯', 'F♯', 'G♯', 'A♯', 'B♯', 'C♯']
elsif user_input_scale == 12
  scale = ['B♭', 'C', 'D', 'E♭', 'F', 'G', 'A', 'B♭']
elsif user_input_scale == 13
  scale = ['A♭', 'B♭', 'C', 'D♭', 'E♭', 'F', 'G', 'A♭']
elsif user_input_scale == 14
  scale = ['G♭', 'A♭', 'B♭', 'C♭', 'D♭', 'E♭', 'F', 'G♭']
else
  puts "Invalid input. Please try again."
  return
end

puts "\n"

puts "Beat Count? Please choose between 4, 8, 16, and 32."
beat_count = gets.chomp.to_i

puts "\n"

if [4, 8, 16, 32].include?(beat_count)
  new_scale_pattern = Array.new

  length = scale.length

  beat_count.times do
    index_position = rand(0...length)
    new_scale_pattern << scale[index_position]
  end

  puts "Generated pattern:"
  p new_scale_pattern
else
  puts "Invalid input. Please try again."
end