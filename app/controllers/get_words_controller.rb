class GetWordsController < ApplicationController
	require 'open-uri'

	def fetch
	  	
	  	def get_words_from_page(page_number)
			doc = Nokogiri::HTML(open("http://www.crosswordsolver.org/solve/----/#{page_number}"))
			words = doc.css("div[class=word]").text.split(' ')
			clues = doc.css("div[class=definition]")

			
			words.each_with_index do |word, i|
				if /^[A-Z]+/.match(word.upcase).to_s.length == 4
					split_word = {}
					split_word[:word] = word
					split_word[:clue] = clues[i].text
					word.split('').each_with_index do |letter, index|
						split_word[eval(":l#{index}")] = letter.upcase
					end
					entry = FourLetterWord.create(split_word)
				end
			end
		end

	fail

	# end of fetch
	end




# end of controller
end
