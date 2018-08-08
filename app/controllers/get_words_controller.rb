class GetWordsController < ApplicationController
	require 'open-uri'
	require 'yaml'

	def fetch

		@words = FourLetterWord.all
	  	
	  	def get_words_from_page(page_number)
			doc = Nokogiri::HTML(open("http://www.crosswordsolver.org/solve/----/#{page_number}"))
			words = doc.css("div[class=word]").text.split(' ')
			clues = doc.css("div[class=definition]")

			
			words.each_with_index do |word, i|
				if /^[A-Z]+/.match(word.upcase).to_s.length == 4
					split_word = {}
					split_word[:word] = word.upcase
					split_word[:clue] = clues[i].text
					word.split('').each_with_index do |letter, index|
						split_word[eval(":l#{index}")] = letter.upcase
					end
					entry = FourLetterWord.create(split_word)
				end
			end
		end

		def create_deep_followers
			deep_followers = {}
			alphabet = Array("A".."Z")
			alphabet.each do |letter, i|
				array = []
				array.push([])
				array.push(@words.where(l0: letter).pluck(:l1).uniq)
				array.push(@words.where(l0: letter).pluck(:l2).uniq)
				array.push(@words.where(l0: letter).pluck(:l3).uniq)
				deep_followers[letter] = array

				file_name = File.join(File.dirname(__FILE__), "../../lib/four_deep_followers.yml")
	
				File.open(file_name, "w") do |file|
					file.write deep_followers.to_yaml
				end
			end
		end

		fail

		

	# counter = 0
	# until counter > 7710
	# 	get_words_from_page(counter)
	# 	counter += 10
	# end
	

	# end of fetch
	end




# end of controller
end
