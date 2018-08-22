require 'yaml'

class Solver

  def initialize(args)
    @root_letter = args[:letter].upcase
    @answer_number = (args[:number].to_i)
    @words = FiveLetterWord.all
    @deep_followers = get_deep_followers
    @roots_words_hash = get_root_words(@words)
  end

  def call
    # now = Time.now
    @answers = []

    #
    # This is where it all begins
    # 	choose the first letter to test
    #
    root_letter_words = @roots_words_hash[@root_letter].pluck(:word)
    while root_letter_words.length > 1 && @answers.count < @answer_number
      @set_words = {}
      @set_words[:across0] = root_letter_words.shift
      @down_list = root_letter_words.clone

      # sets up the inital hashes
      @searches = {}
      @spreads = {}
      @builders = {}
      @old_word = {}
      @ignore = {}
      @list = {}
      @depth = 0

      old_down = nil
      while @down_list.count > 0 && @answers.count < @answer_number
        @down = @down_list.shift
        @set_words[:down0] = @down

        setup_search

        setup_spreads(0)
        setup_builders(0)
        @list[1] = create_new_word_list(0)

        search_block(1)

        prune_list
        hold = @set_words[:across0]
        @set_words = {}
        @set_words[:across0] = hold

        # end level 0 pick new down word
      end

      # pick new root word
    end

    # later = Time.now
    # howlong = "took #{later - now} seconds"
    # @answers.push(howlong)

    file_name = File.join(File.dirname(__FILE__), "../../lib/answers/five_letter_answers/#{@root_letter}.yml")

    File.open(file_name, "w") do |file|
      file.write @answers.to_yaml
    end
    [@answers, @words]
  end

  private

  def get_deep_followers
    deep_followers_File = File.join(File.dirname(__FILE__), "../../lib/five_deep_followers.yml")
    YAML.load_file(deep_followers_File)
  end

  def get_root_words(words)
    Array("A".."Z").map do |letter|
      [letter, words.where(l0: letter)]
    end.to_h
  end

  def setup_search
    array = []
    @set_words[:across0].split('').each_with_index do |letter, i|
      unless i == 0
        array[i] = @roots_words_hash[letter]
      end
    end
    @searches[0] = array
  end

  # set up the spreads
  def setup_spreads(level)
    array = []
    @searches[level].each_with_index do |record, i|
      unless i == 0
        array[i] = eval("record.pluck(:l#{level + 1}).uniq")
      end
    end
    @spreads[level] = array
  end

  def spread_with_ignore(level)
    if @spreads[level - 1] == nil
      array = []
    else
      array = @spreads[level - 1].clone
    end
    @searches[level].each_with_index do |record, i|
      unless i == 0 || @ignore[level][i] == true
        array[i] = eval("record.pluck(:l#{level + 1}).uniq")
      end
    end
    @spreads[level] = array
  end

  # set up the builder list
  def setup_builders(level)
    array = []
    @spreads[level].each_with_index do |letters, i|
      if i == 0
        array[i] = @down[level + 1]
      else
        array[i] = @deep_followers[@down[level + 1]][i] & letters
      end
    end
    @builders[level] = array
  end

  def builders_with_ignore(level)
    if @builders[level] == nil
      array = []
    else
      array = @builders[level].clone
    end

    # 3.times {puts ""}
    # puts "builder array before ignore"
    # p array
    # p @ignore[level]
    @spreads[level].each_with_index do |letters, i|
      if i == 0
        array[i] = @down[level + 1]
      elsif @ignore[level][i] == true
      else
        array[i] = @deep_followers[@down[level + 1]][i] & letters
      end
    end
    @builders[level] = array
    # puts "builder after ignore"
    # p @builders[level]
  end

  # use the builders to create a list of next possible words
  def create_new_word_list(level)
    builders = @builders[level]
    @words.where(
      l0: builders[0],
      l1: builders[1],
      l2: builders[2],
      l3: builders[3],
      l4: builders[4]
    ).where.not(word: @set_words.values).pluck(:word)
  end

  def refine_search(level)
    array = []
    @set_words[level].split('').each_with_index do |letter, i|
      unless i == 0
        array[i] = eval("@searches[level - 1][i].where(l#{level}:letter)")
      end
    end
    @searches[level] = array
  end

  def search_with_ignore(level)
    if @searches[level] == nil
      array = []
    else
      array = @searches[level].clone
    end
    @set_words[level].split('').each_with_index do |letter, i|
      unless i == 0 || @ignore[level][i] == true
        array[i] = eval("@searches[level - 1][i].where(l#{level}:letter)")
      end
    end
    @searches[level] = array
  end

  def find_word_diff(level)
    array = []
    unless @old_word[level] == nil
      @old_word[level].split('').each_with_index do |letter, i|
        (letter == @set_words[level][i]) ? array[i] = true : array[i] = false
      end
    end
    @ignore[level] = array
  end

  def set_depth(level)
    (level > @depth) ? @depth = level : ''
  end

  def prune_list
    # puts "down word: #{@down}"
    # puts "depth: #{@depth}"
    # puts "before #{@down_list}"

    @down_list.select! {|word| word[0..(@depth + 1)] != @down[0..(@depth + 1)] }
    @depth = 0

    # end
    # puts ""
    # puts "after #{@down_list}"
  end

  def search_block(level)
    @old_word[level] = nil
    while @list[level].count > 0 && @answers.count < @answer_number
      unless level == 4
        @old_word[level] = @set_words[level]
        @set_words[level] = @list[level].shift
        puts "word #{level} #{@set_words}"
        find_word_diff(level)
        search_with_ignore(level)
        spread_with_ignore(level)
        builders_with_ignore(level)
        @list[level + 1] = create_new_word_list(level)
        set_depth(level)
        if @list[level + 1].count > 0 && level < 4
          search_block(level + 1)
        end
      else
        @set_words[level] = @list[level].shift
        @answers.push(@set_words.values)
        puts "four deep: #{@set_words}"
      end
    end
    @set_words.delete(level)
  end
end