class User < ActiveRecord::Base
  include RatingAverage

  validates :username, uniqueness: true,
                       length: { in: 3..15 }

  validates :password, length: { minimum: 3 },
                       format: { with: /.*(\d.*[A-Z]|[A-Z].*\d).*/,
                                 message: "should contain a uppercase letter and a number" }


  has_secure_password

  has_many :ratings, dependent: :destroy
  has_many :beers, through: :ratings
  has_many :memberships, dependent: :destroy
  has_many :beer_clubs, through: :memberships

	def favorite_beer
		return nil if ratings.empty?
    	ratings.order(score: :desc).limit(1).first.beer
 	end

	def create_beers_with_ratings(*scores, user)
  		scores.each do |score|
    	create_beer_with_rating(score, user)
  	end
end

end
