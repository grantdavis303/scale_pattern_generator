require 'pry'
require './lib/text_block.rb'

intro_text = File.read('./text_blocks/intro_text.txt')
invalid_input_text = File.read('./text_blocks/invalid_input_text.txt')
major_scales_list = File.read('./text_blocks/major_scales_list.txt')
minor_scales_list = File.read('./text_blocks/minor_scales_list.txt')

intro_text_block = TextBlock.new(intro_text)
invalid_input_text_block = TextBlock.new(invalid_input_text)
major_scales_text_block = TextBlock.new(major_scales_list)
minor_scales_text_block = TextBlock.new(minor_scales_list)

scales = {
  '1': ['C', 'D', 'E', 'F', 'G', 'A', 'B', 'C'],
  '2': ['G', 'A', 'B', 'C', 'D', 'E', 'F♯', 'G'],
  '3': ['D', 'E', 'F♯', 'G', 'A', 'B', 'C♯', 'D'],
  '4': ['A', 'B', 'C♯', 'D', 'E', 'F♯', 'G♯', 'A'],
  '5': ['E', 'F♯', 'G♯', 'A', 'B', 'C♯', 'D♯', 'E'],
  '6': ['F', 'G', 'A', 'B♭', 'C', 'D', 'E', 'F'],
  '7': ['B♭', 'C', 'D', 'E♭', 'F', 'G', 'A', 'B♭'],
  '8': ['E♭', 'F', 'G', 'A♭', 'B♭', 'C', 'D', 'E♭'],
  '9': ['A♭', 'B♭', 'C', 'D♭', 'E♭', 'F', 'G', 'A♭'],
  '10': ['B', 'C♯', 'D♯', 'E', 'F♯', 'G♯', 'A♯', 'B'],
  '11': ['C♭', 'D♭', 'E♭', 'F♭', 'G♭', 'A♭', 'B♭', 'C♭'],
  '12': ['F♯', 'G♯', 'A♯', 'B', 'C♯', 'D♯', 'E♯', 'F♯'],
  '13': ['G♭', 'A♭', 'B♭', 'C♭', 'D♭', 'E♭', 'F', 'G♭'],
  '14': ['C♯', 'D♯', 'E♯', 'F♯', 'G♯', 'A♯', 'B♯', 'C♯'],
  '15': ['D♭', 'E♭', 'F', 'G♭', 'A♭', 'B♭', 'C', 'D♭'],
  '16': ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'A'],
  '17': ['E', 'F♯', 'G', 'A', 'B', 'C', 'D', 'E'],
  '18': ['B', 'C♯', 'D', 'E', 'F♯', 'G', 'A', 'B'],
  '19': ['F♯', 'G♯', 'A', 'B', 'C♯', 'D', 'E', 'F♯'],
  '20': ['C♯', 'D♯', 'E', 'F♯', 'G♯', 'A', 'B', 'C♯'],
  '21': ['F', 'G', 'A♭', 'B♭', 'C', 'D♭', 'E♭', 'F'],
  '22': ['C', 'D', 'E♭', 'F', 'G', 'A♭', 'B♭', 'C'],
  '23': ['G', 'A', 'B♭', 'C', 'D', 'E♭', 'F', 'G'],
  '24': ['D', 'E', 'F', 'G', 'A', 'B♭', 'C', 'D'],
  '25': ['G♯', 'A♯', 'B', 'C♯', 'D♯', 'E', 'F♯', 'G♯'],
  '26': ['A♭', 'B♭', 'C♭', 'D♭', 'E♭', 'F♭', 'G♭', 'A♭'],
  '27': ['D♯', 'E♯', 'F♯', 'G♯', 'A♯', 'B', 'C♯', 'D♯'],
  '28': ['E♭', 'F', 'G♭', 'A♭', 'B♭', 'C♭', 'D♭', 'E♭'],
  '29': ['A♯', 'B♯', 'C♯', 'D♯', 'E♯', 'F♯', 'G♯', 'A♯'],
  '30': ['B♭', 'C', 'D♭', 'E♭', 'F', 'G♭', 'A♭', 'B♭']
}

# Scale Pattern Generator Program

puts intro_text_block.content

puts "List which set of scales? Please choose either 1 or 2."
scales_list_input = gets.chomp.to_i

puts "\n"

if scales_list_input == 1
  puts major_scales_text_block.content
elsif scales_list_input == 2
  puts minor_scales_text_block.content
else
  puts invalid_input_text_block.content
  return
end

puts "Which Scale? Please choose a number between 1 and 30."
user_input_scale = gets.chomp.to_sym

if scales[user_input_scale.to_sym]
  scale = scales[user_input_scale]
else
  puts "\n"
  puts invalid_input_text_block.content
  return
end

puts "\n"
puts "Beat Count? Please choose between 2, 4, 8, 16, and 32."
beat_count = gets.chomp.to_i

puts "\n"
puts "Add variation to time signature? Please choose y or n."
input_time_signature = gets.chomp

if input_time_signature == 'y'
  time_signature = true
else
  time_signature = false
end

if [2, 4, 8, 16, 32].include?(beat_count)
  generated_scale_pattern = Array.new
  beat_counter = 0 if time_signature == true

  beat_count.times do
    index_position = rand(0...scale.length)
    generated_scale_pattern << scale[index_position]

    # Add functionality for time_signature being true
  end

  puts "\n"
  puts "Generated pattern:"
  p generated_scale_pattern
else
  puts "\n"
  puts invalid_input_text_block.content
end