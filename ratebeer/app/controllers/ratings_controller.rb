class RatingsController < ApplicationController
  def new
    @rating = Rating.new
    @beers = Beer.all
  end


	def new
		@rating = Rating.new
	end
end
