class ReservationMailer < ApplicationMailer
  default from: 'from@tteyo.com'
  layout 'mailer'
  def reservation_mail(reservation)
    @reservation = reservation
    mail to: "kitchen.number@gmail.com", subject: "予約の確認メール"
  end
end