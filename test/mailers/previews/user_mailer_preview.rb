# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/Deadline_notice
  def Deadline_notice
    UserMailer.Deadline_notice
  end

end
