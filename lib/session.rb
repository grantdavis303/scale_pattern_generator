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

    puts "Which scale? Please choose a number between 1 and 30."
    user_input_scale = gets.chomp.to_sym

    if scales[user_input_scale.to_sym]
      scale = scales[user_input_scale]
    else
      puts "\n"
      puts invalid_input_text_block.content
      return
    end

    puts "\n"
    puts "Beat count? Please choose between 2, 4, 8, 16, and 32."
    beat_count = gets.chomp.to_i

    puts "\n"
    puts "Add variation to time signature? Please choose y or n."
    input_time_signature = gets.chomp

    if input_time_signature == 'y'
      vary_time_signature = true
    else
      vary_time_signature = false
    end

    if [2, 4, 8, 16, 32].include?(beat_count)
      generated_scale_pattern = Array.new

      if vary_time_signature == true
        until calculate_beat_sum(generated_scale_pattern) >= beat_count
          generated_scale_pattern << scale[rand(0...scale.length)]
          generated_scale_pattern << rand(1...4)

          if calculate_beat_sum(generated_scale_pattern) > beat_count
            beat_sum = calculate_beat_sum(generated_scale_pattern)
            generated_scale_pattern[generated_scale_pattern.length - 1] = beat_sum - beat_count
            break
          end
        end
      else
        beat_count.times { generated_scale_pattern << scale[rand(0...scale.length)] }
      end

      puts "\n"
      puts "Generated pattern: #{generated_scale_pattern}"
    else
      puts "\n"
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