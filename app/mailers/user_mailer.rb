class UserMailer < ApplicationMailer

  def account_activation(user)
    @user = user
    mail to: user.email, subject: t('devise.mailer.confirmation_instructions.subject')
  end

  def password_reset(user)
    @user = user
    mail to: user.email, subject: t('devise.mailer.reset_password_instructions.subject')
  end
end
