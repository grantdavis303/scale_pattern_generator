require 'pry'
require './text_block.rb'

intro_text = File.read('./text_blocks/intro_text.txt')
major_scales_list = File.read('./text_blocks/major_scales_list.txt')
minor_scales_list = File.read('./text_blocks/minor_scales_list.txt')

intro_text_block = TextBlock.new("Intro Block Text", intro_text)
major_scale_text_block = TextBlock.new("Major Scale List", major_scales_list)
minor_scales_text_block = TextBlock.new("Minor Scale List", minor_scales_list)

# Scale Pattern Generator Program

puts intro_text_block.content

scales_list_input = gets.chomp.to_i

if scales_list_input == 1
  puts major_scale_text_block.content
elsif scales_list_input == 2
  puts minor_scales_text_block.content
else
  puts "Invalid input. Please try again."
  return
end

puts "Which Scale? Please choose a number between 1 and 30."
user_input_scale = gets.chomp.to_i









# # These are wrong - change

# if user_input_scale == 1
#   scale = ['C', 'D', 'E', 'F', 'G', 'A', 'B', 'C']
# elsif user_input_scale == 2
#   scale = ['D', 'E', 'F♯', 'G', 'A', 'B', 'C♯', 'D']
# elsif user_input_scale == 3
#   scale = ['E', 'F♯', 'G♯', 'A', 'B', 'C♯', 'D♯', 'E']
# elsif user_input_scale == 4
#   scale = ['F♯', 'G♯', 'A♯', 'B', 'C♯', 'D♯', 'E♯', 'F♯']
# elsif user_input_scale == 5
#   scale = ['F', 'G', 'A', 'B♭', 'C', 'D', 'E', 'F']
# elsif user_input_scale == 6
#   scale = ['E♭', 'F', 'G', 'A♭', 'B♭', 'C', 'D', 'E♭']
# elsif user_input_scale == 7
#   scale = ['D♭', 'E♭', 'F', 'G♭', 'A♭', 'B♭', 'C', 'D♭']
# elsif user_input_scale == 8
#   scale = ['G', 'A', 'B', 'C', 'D', 'E', 'F♯', 'G']
# elsif user_input_scale == 9
#   scale = ['A', 'B', 'C♯', 'D', 'E', 'F♯', 'F♯', 'A']
# elsif user_input_scale == 10
#   scale = ['B', 'C♯', 'D♯', 'E', 'F♯', 'G♯', 'A♯', 'B']
# elsif user_input_scale == 11
#   scale = ['C♯', 'D♯', 'E♯', 'F♯', 'G♯', 'A♯', 'B♯', 'C♯']
# elsif user_input_scale == 12
#   scale = ['B♭', 'C', 'D', 'E♭', 'F', 'G', 'A', 'B♭']
# elsif user_input_scale == 13
#   scale = ['A♭', 'B♭', 'C', 'D♭', 'E♭', 'F', 'G', 'A♭']
# elsif user_input_scale == 14
#   scale = ['G♭', 'A♭', 'B♭', 'C♭', 'D♭', 'E♭', 'F', 'G♭']
# else
#   puts "Invalid input. Please try again."
#   return
# end

# puts "\n"

# puts "Beat Count? Please choose between 2, 4, 8, 16, and 32."
# beat_count = gets.chomp.to_i

# puts "\n"

# if [2, 4, 8, 16, 32].include?(beat_count)
#   new_scale_pattern = Array.new

#   length = scale.length

#   beat_count.times do
#     index_position = rand(0...length)
#     new_scale_pattern << scale[index_position]
#   end

#   puts "Generated pattern:"
#   p new_scale_pattern
# else
#   puts "Invalid input. Please try again."
# end