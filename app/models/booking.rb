class Booking < ActiveRecord::Base
  has_one :price, through: :training
  has_one :timeframe, through: :training
  has_one :training
  accepts_nested_attributes_for :training
end
