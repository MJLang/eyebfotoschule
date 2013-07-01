class Booking < ActiveRecord::Base
  has_one :price, through: :training
  has_one :timeframe, through: :training
  has_one :training
  accepts_nested_attributes_for :training

  validates_presence_of :name

  validates_presence_of :telephone
  # validates_numericality_of :telephone

  validates_presence_of :email
  validates_format_of :email, with: /@/

  delegate :course, to: :training

end
