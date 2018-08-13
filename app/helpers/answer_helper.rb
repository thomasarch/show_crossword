module AnswerHelper
	def get_down_words(array)
		down_list = []
		5.times do |letter|
			word = ''
			6.times do |count|
				unless count == 1
					word.concat(array[count][letter])
				end
			end
			down_list.push(word)
		end
		down_list
	end

	def get_clue(word)
		@words.where(word: word).pluck(:clue)[0].split('-')[1]
	end
end
