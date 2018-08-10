class PagesController < ApplicationController
	require 'open-uri'
	require 'yaml'
	
	def show

		file0 = File.join(File.dirname(__FILE__), "../../lib/five_deep_followers.yml")
		@deep_followers = YAML.load_file(file0)

		@words = FiveLetterWord.all

		def get_words_from_page(page_number)
			@doc = Nokogiri::HTML(open("http://www.crosswordsolver.org/solve/-----/#{page_number}"))
			@nokowords = @doc.css("div[class=word]")
			@clues = @doc.css("div[class=definition]")
		end
		get_words_from_page(400)
		
		render template: "pages/#{params[:page]}"
	end
end
