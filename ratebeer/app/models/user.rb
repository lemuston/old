class User < ActiveRecord::Base
  has_many :ratings   # käyttäjällä on monta ratingia
end

class Rating < ActiveRecord::Base
  belongs_to :beer
  belongs_to :user   # rating kuuluu myös käyttäjään

  def to_s
    "#{beer.name} #{score}"
  end
end
