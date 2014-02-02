class User < ActiveRecord::Base
	include RatingAverage

  	validates :username, uniqueness: true,
                       length: { minimum: 3, maximum: 15 }
	
	validates :password,
                       length: { minimum: 3 }

	validates_format_of :password, :with => /^[([A-Z])0-9_-]/

	has_many :ratings   # käyttäjällä on monta ratingia
	has_secure_password
end

class Rating < ActiveRecord::Base
  belongs_to :beer
  belongs_to :user   # rating kuuluu myös käyttäjään

  def to_s
    "#{beer.name} #{score}"
  end
end
