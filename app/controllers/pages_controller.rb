class PagesController < ApplicationController
	require 'open-uri'
	require 'yaml'

	def show

		def get_words_from_page(page_number)
			@doc = Nokogiri::HTML(open("http://www.crosswordsolver.org/solve/-----/#{page_number}"))
			@words = @doc.css("div[class=word]")
			@clues = @doc.css("div[class=definition]")
		end
		get_words_from_page(400)
		
		render template: "pages/#{params[:page]}"
	end
end
