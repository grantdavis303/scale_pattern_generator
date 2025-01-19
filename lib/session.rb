class Session
  attr_reader :scales

  def initialize(scales)
    @scales = scales
  end

  def start
    loop do
      generate_scale_pattern

      puts "\n"
      puts "Generate another? Please choose either y or n."
      go_again = gets.chomp

      if go_again == 'y'
        start
      else
        break
      end
    end
  end

  def generate_scale_pattern
    intro_text_block = initialize_text_file('./text_blocks/intro_text.txt')
    invalid_input_text_block = initialize_text_file('./text_blocks/invalid_input_text.txt')
    major_scales_text_block = initialize_text_file('./text_blocks/major_scales_list.txt')
    minor_scales_text_block = initialize_text_file('./text_blocks/minor_scales_list.txt')

    puts intro_text_block.content

    # Question 1
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

    # Question 2
    puts "Which scale? Please choose a number between 1 and 30."
    user_input_scale = gets.chomp.to_sym

    if scales[user_input_scale.to_sym]
      scale = scales[user_input_scale]
    else
      puts invalid_input_text_block.content
      return
    end

    puts "\n"

    # Question 3
    puts "Beat count? Please choose between 2, 4, 8, 16, and 32."
    beat_count = gets.chomp.to_i

    if [2, 4, 8, 16, 32].include?(beat_count)
      beat_count_valid = true
    else
      beat_count_valid = false
    end

    # Summary
    if beat_count_valid == true
      generated_scale_pattern = Array.new

      beat_count.times do
        random_note = rand(0..scale.length - 1)
        generated_scale_pattern << scale[random_note]
      end

      puts "\n"
      puts "Generated pattern: #{generated_scale_pattern}"
    else
      puts invalid_input_text_block.content
    end
  end

  def initialize_text_file(path)
    TextBlock.new(File.read(path))
  end
end