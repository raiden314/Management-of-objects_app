class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.Deadline_notice.subject
  #
  def Deadline_notice
    @greeting = "Hii"
      @show=[]
    # @show=show
    # @user=user
    cnt=1
    @list=["name","date","memo","image_name"]
    @users = User.all
    @posts = Post.where(date: (Time.now.since(30.days)))
    @user=""
    @users = []
    @posts.each do |post|
      @users << User.where(id: (post.user_id)).pluck("email")
    end
    if @users != nil
      @users.each do |user|
        @show = []
        count=0
        @posts.each do |post|
          @show[count] = Post.where(id: (post.id)).pluck("name")
          count=count+1
          @show[count] = Post.where(id: (post.id)).pluck("date")
          count=count+1
          @show[count] = Post.where(id: (post.id)).pluck("memo")
          count=count+1
          @show[count] = Post.find_by(id: (post.id)).image_name
          count=count+1
        end
        if cnt<=@users.count and cnt != 1
          for i in 0..3 do
            @show[i]=@show[i+(cnt-1)*4]
            @b<<i+(cnt-1)*4
          end
          cnt=cnt+1
          mail(to: user, subject: 'TMSからのお知らせです!!')
        elsif cnt==1
          mail(to: user, subject: 'TMSからのお知らせです!!')
          cnt=cnt+1
        end
      end
    end
  end
end
