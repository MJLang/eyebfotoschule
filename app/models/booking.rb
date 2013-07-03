class Booking < ActiveRecord::Base
  has_one :price, through: :training
  has_one :timeframe, through: :training
  has_one :training
  accepts_nested_attributes_for :training

  scope :in_future, -> { joins(:training).where('trainings.date > ?', Time.zone.now).load }
  scope :in_past, -> { joins(:training).where('trainings.date < ?', Time.zone.now).load }
  scope :received_today, -> { where(:created_at => Time.zone.now.beginning_of_day..Time.zone.now.end_of_day) }
  scope :tomorrow, -> { joins(:training).where(:trainings => {:date => Time.zone.now.tomorrow.beginning_of_day..Time.zone.now.end_of_day}).load}
  scope :today, -> { joins(:training).where(:trainings => {:date => Time.zone.now.beginning_of_day..Time.zone.now.end_of_day}).load }

  validates_presence_of :name

  validates_presence_of :telephone
  # validates_numericality_of :telephone

  validates_presence_of :email
  validates_format_of :email, with: /@/

  delegate :course, to: :training

  def cost_in_francs
    Money.new(cost, "CHF").format(:with_currency => true, :symbol => false)
  end

  def cost
    self.persons * self.training.price.amount
  end


end
