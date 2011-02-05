class MainController < ApplicationController

	def index
		@tag = Instagram::search_tags("#instaderek").first
		@photos = Instagram::by_tag(@tag)
	end
end
