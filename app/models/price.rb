class Price < ActiveRecord::Base
  belongs_to :course

  def to_francs
    Money.new(self.amount, "CHF").format(:with_currency => true, :symbol => false)
  end
end
