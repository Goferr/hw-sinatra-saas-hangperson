class HangpersonGame

  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/hangperson_game_spec.rb pass.
attr_accessor :word, :guesses, :wrong_guesses
  # Get a word from remote "random word" service

  # def initialize()
  # end
  
  def initialize(word)
	@word = word
	@guesses ||= ''
	@wrong_guesses ||= ''
  end

  def guess(guess)
  
    raise(ArgumentError) if guess == ''
    raise(ArgumentError) if guess == nil
    raise(ArgumentError) if guess !~ /[a-zA-Z]/
  
    if guess.downcase == @guesses || guess.downcase == @wrong_guesses
      return false
    end
  if @word.include? guess
    @guesses = guess
	else
    @wrong_guesses = guess
  end
  end

  def check_win_or_lose
  end

  def  word_with_guesses
  end
  
  
  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
    Net::HTTP.post_form(uri ,{}).body
  end

end

