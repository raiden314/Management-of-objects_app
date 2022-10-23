namespace :roop do
  desc "メール送信の定期実行"
  task :try => :environment do
    logger = Logger.new 'log/recover_user_life.log'
      begin
        # puts User.first().to_yaml
        UserMailer.Deadline_notice.deliver_now
 
      rescue => e
        #何かしらエラーがs起きたら、エラーログの書き込み ただし次のユーザーの処理へは進む
        logger.error "user_id: #{user.id}でエラーが発生"
        logger.error es
        logger.error e.backtrace.join("\n")
        next
      end
  end
end