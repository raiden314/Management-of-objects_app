class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.Deadline_notice.subject
  #
  def Deadline_notice
    @greeting = "Hi"
    @users = User.all
    @posts = Post.where(date: (Time.now.since(30.days)))
    @user=""
    @users = []
    @posts.each do |post|
      @users << User.where(id: (post.user_id)).pluck("email")
      
    end
    if @users != nil
      @users.each do |user|
        mail(to: user, subject: 'Welcome to My Awesome Site')
      end
    end
  end
end