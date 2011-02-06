class TagsController < ApplicationController
	def index
		@popular = Instagram::popular
	end
end
