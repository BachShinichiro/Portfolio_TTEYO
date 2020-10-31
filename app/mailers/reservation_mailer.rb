class ReservationMailer < ApplicationMailer
  default from: 'from@tteyo.com'
  layout 'mailer'
  def reservation_mail(reservation)
    @reservation = reservation
    mail to: [reservation.user.email, reservation.event.user.email], subject: "予約の確認メール"
  end
end