class Session
  attr_reader :scales

  def initialize(scales)
    @scales = scales
  end

  def start
    intro_text_block = initialize_text_file('./text_blocks/intro_text.txt')
    invalid_input_text_block = initialize_text_file('./text_blocks/invalid_input_text.txt')
    major_scales_text_block = initialize_text_file('./text_blocks/major_scales_list.txt')
    minor_scales_text_block = initialize_text_file('./text_blocks/minor_scales_list.txt')

    puts intro_text_block.content

    # Question 1
    puts "List which set of scales? Please choose either 1 or 2."
    scales_list_input = gets.chomp.to_i

    if scales_list_input == 1
      puts major_scales_text_block.content
    elsif scales_list_input == 2
      puts minor_scales_text_block.content
    else
      puts invalid_input_text_block.content
      return
    end

    # Question 2
    puts "Which scale? Please choose a number between 1 and 30."
    user_input_scale = gets.chomp.to_sym

    if scales[user_input_scale.to_sym]
      scale = scales[user_input_scale]
    else
      puts invalid_input_text_block.content
      return
    end

    # Question 3
    puts "Beat count? Please choose between 2, 4, 8, 16, and 32."
    beat_count = gets.chomp.to_i

    if [2, 4, 8, 16, 32].include?(beat_count)
      beat_count_valid = true
    else
      beat_count_valid = false
    end

    # Question 4
    puts "Add variation to time signature? Please choose y or n."
    input_time_signature = gets.chomp

    if input_time_signature == 'y'
      vary_time_signature = true
    else
      vary_time_signature = false
    end

    # Summary
    generated_scale_pattern = Array.new

    if beat_count_valid == true && vary_time_signature == true
      sum = 0

      numbers_array = Array.new
      until sum >= beat_count
        random_number = rand(1..4)
        numbers_array << random_number
        sum += random_number

        # Needs fixing
        if sum > beat_count
          difference = sum - beat_count
          difference.times do
            numbers_array[rand(0..numbers_array.length - 1)] -= 1
          end
        end
      end

      puts "Count: #{numbers_array.length}"
      puts "Sum: #{numbers_array.sum}"
      puts "New Arr: #{numbers_array}"

      numbers_array.each do |number|
        generated_scale_pattern << scale[rand(0..scale.length - 1)]
        generated_scale_pattern << number
      end

      puts "Generated pattern: #{generated_scale_pattern}"
    elsif beat_count_valid == true && vary_time_signature == false
      beat_count.times { generated_scale_pattern << scale[rand(0..scale.length)] }
      puts "Generated pattern: #{generated_scale_pattern}"
    else
      puts invalid_input_text_block.content
    end
  end

  def initialize_text_file(path)
    TextBlock.new(File.read(path))
  end

  def calculate_beat_sum(generated_scale_pattern)
    generated_scale_pattern.map { |value| value if value.class == Integer }.compact.sum
  end
end