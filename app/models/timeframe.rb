class Timeframe < ActiveRecord::Base
  belongs_to :course

  def to_de_s
    tage = self.days > 1 ? "Tage" : "Tag"
    "#{days} #{tage} (#{self.starts_at.strftime('%R')} - #{self.ends_at.strftime('%R')})"
  end

end
