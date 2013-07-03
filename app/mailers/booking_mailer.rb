class BookingMailer < ActionMailer::Base
  default from: "\"EyeB-Fotoschule\" <info@eyebfotoschule.com>"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.booking_mailer.confirmation_mail.subject
  #
  def confirmation_mail(email, booking)
    @greeting = "Hi"

    mail to: email
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.booking_mailer.summary_mail.subject
  #
  def summary_mail
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
