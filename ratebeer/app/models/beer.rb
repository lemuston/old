class Beer < ActiveRecord::Base
  belongs_to :brewery
  has_many :ratings

  def average_rating
	sum = 0
    self.ratings.each do |rating|
	 sum = sum + rating.score
	end

	sum / self.ratings.count
  end


end


