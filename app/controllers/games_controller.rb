require 'open-uri'
require 'json'

######

class GamesController < ApplicationController
  def new
    @letters = generate_grid(10)
    @letters_string = @letters.to_s
  end

  def score
    @word = params[:word]
    @grid = params[:grid]
    @score_message = @word.size
    @count_letters = count_letters(@grid, @word)
  end
end

###### DETAILED METHODS BELOW #######

def generate_grid(grid_size)
  Array.new(grid_size) { ('A'..'Z').to_a.sample }
end



# def english_word?(word)
#   response = open("https://wagon-dictionary.herokuapp.com/#{word}")
#   json = JSON.parse(response.read)
#   return json['found']
# end

# def score_and_message(attempt, grid)
#   if included?(attempt.upcase, grid)
#   	return attempt.size
#   else 
#   	return "not in the grid"
#   end
# end

# def included?(guess, grid)
#   guess.chars.all? { |letter| guess.count(letter) <= grid.count(letter) }
# end

def count_letters(grid, word)
	result = {}
	word.chars.all? { |letter| result[letter] = [word.count(letter) <= grid.count(letter)] }
	return result
end

