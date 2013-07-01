class Price < ActiveRecord::Base
  belongs_to :course

  def to_francs
    Money.new(self.amount, "CHF").format(:with_currency => true, :symbol => false)
  end

  def display
    self.description.empty? ? "#{self.to_francs}" : "#{self.to_francs} - #{self.description}"
  end
end
