namespace :roop do
  desc "メール送信の定期実行"
  task :try => :environment do
    logger = Logger.new 'log/recover_user_life.log'
      begin
        # puts User.first().to_yaml

        # @users = User.all
        # @posts = Post.where(date: (Time.now.since(30.days)))
        # @user=""
        # @users = []
        # @posts.each do |post|
        #   @users << User.where(id: (post.user_id)).pluck("email")
        # end
        # if @users != nil
        #   @users.each do |user|
        #     @show = []
        #     @posts.each do |post|
        #       for count in 0..3 do
        #         @show[count] = Post.where(id: (post.id)).pluck("name")
        #         count=count+1
        #         @show[count] = Post.where(id: (post.id)).pluck("date")
        #         count=count+1
        #         @show[count] = Post.where(id: (post.id)).pluck("memo")
        #         count=count+1
        #         @show[count] = Post.find_by(id: (post.id)).image_name
        #         count=count+1
        #       end
              UserMailer.Deadline_notice.deliver_now
        #     end
        #   end
        # end
        
 
      rescue => e
        #何かしらエラーがs起きたら、エラーログの書き込み ただし次のユーザーの処理へは進む
        logger.error "user_id: #{user.id}でエラーが発生"
        logger.error es
        logger.error e.backtrace.join("\n")
        next
      end
  end
end

# user.email,post.name,post.date,post.memo,post.image_name
# user.id=post.user_id