class User < ActiveRecord::Base
	include RatingAverage

  	validates :username, uniqueness: true,
                       length: { minimum: 3, maximum: 15 }

	has_many :ratings   # käyttäjällä on monta ratingia
end

class Rating < ActiveRecord::Base
  belongs_to :beer
  belongs_to :user   # rating kuuluu myös käyttäjään

  def to_s
    "#{beer.name} #{score}"
  end
end
