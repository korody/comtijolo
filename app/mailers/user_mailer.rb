# encoding:   utf-8
class UserMailer < ActionMailer::Base
  default from: "tijolo@comTijolo.com"

  def password_reset(user)
    @user = user
    mail to: "kalina@kaju.ink", subject: "nova senha comTijolo"
  end

  def contact(message)
    @message = message
    mail to: "kalina@kaju.ink", subject: "Iei! Leitor comtijolo quer conversar. : )"
  end

end
