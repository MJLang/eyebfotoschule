class Course < ActiveRecord::Base
  has_many :prices
  has_many :timeframes
  has_many :images, as: :attachable
end
