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

  before_create :generate_number

  def cost_in_francs
    Money.new(cost, "CHF").format(:with_currency => true, :symbol => false)
  end

  def cost
    self.persons * self.training.price.amount
  end

  def generate_booking_pdf(title)
    Prawn::Document.generate("#{title.parameterize}.pdf") do |pdf|
      #Setup Letterhead
      y_position = pdf.cursor
      pdf.image("#{Rails.root}/app/assets/images/logo/logo-dark.png", at: [0, y_position], fit: [200, 200])
      pdf.text_box "EyeB-Fotoschule Basel", :at => [300, y_position]
      pdf.text_box "Metzerstrasse 24", :at => [300, (y_position - 15)]
      pdf.text_box "4056 Basel", :at => [300, (y_position - 30)]
      pdf.text_box "Tel: (+41) 079 7362701", at: [300, (y_position - 45)]
      pdf.text_box "Email: info@eyebfotoschule.com", at: [300, (y_position - 60)]
      pdf.move_down 80
      pdf.stroke_horizontal_rule

      #Buchungsuebersicht
      pdf.move_down 30
      pdf.text "Buchungsbestaetigung", align: :center, size: 24

      pdf.move_down 20

      pdf.text "Buchungsnummer: #{self.number}"
      pdf.text "Buchungstag: #{self.created_at.strftime("%d/%m/%y")}"
      pdf.move_down 10
      pdf.text "Name: #{self.name}"
      pdf.text "Email: #{self.email}"
      pdf.text "Tel: #{self.telephone}"

      pdf.move_down 10

      pdf.text "<b>Buchungsdetails</b>", inline_format: true
      pdf.move_down 5
      pdf.text "Kurs: #{self.course.name}"
      pdf.text "Termin: #{self.training.date_to_s}"
      pdf.text "Personen: #{self.persons}"
      pdf.text "Preis (Pro Person): #{self.training.price.display}"
      pdf.text "Ausstehender Betrag: #{self.cost_in_francs}"
      pdf.text "Anmerkungen: #{self.notes}"

      pdf.move_down 40

      pdf.text "Herzlichen Dank fuer ihre Buchung"
      pdf.text "EyeB-Fotoschule Basel"

    end
  end

  def generate_number
    self.number = "EYEB-#{Array.new(9){rand(9)}.join}"
  end

  def display
    "#{self.course.name} - #{self.training.date_to_s} - #{self.name}"
  end

  



end
