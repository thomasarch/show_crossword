class GetWordsController < ApplicationController
	require 'open-uri'
	require 'yaml'

	def fetch

	  	
	  	def get_words_from_page(page_number)
			doc = Nokogiri::HTML(open("http://www.crosswordsolver.org/solve/--------/#{page_number}"))
			words = doc.css("div[class=word]")
			clues = doc.css("div[class=definition]")

			words.each_with_index do |w, i|
				word = w.text.strip.upcase
				if /^[A-Z]+/.match(word).to_s.length == 8
					split_word = {}
					split_word[:word] = word
					split_word[:clue] = clues[i].text
					word.split('').each_with_index do |letter, index|
						split_word[eval(":l#{index}")] = letter.upcase
					end
					entry = EightLetterWord.create(split_word)
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
				array.push(@words.where(l0: letter).pluck(:l4).uniq)
				array.push(@words.where(l0: letter).pluck(:l5).uniq)
				array.push(@words.where(l0: letter).pluck(:l6).uniq)
				array.push(@words.where(l0: letter).pluck(:l7).uniq)
				deep_followers[letter] = array

				file_name = File.join(File.dirname(__FILE__), "../../lib/eight_deep_followers.yml")
	
				File.open(file_name, "w") do |file|
					file.write deep_followers.to_yaml
				end
			end
		end


	# counter = 26410
	# until counter > 31070
	# 	get_words_from_page(counter)
	# 	counter += 10
	# end

	# @words = EightLetterWord.all

	# create_deep_followers
	


	# end of fetch
	end




# end of controller
end
