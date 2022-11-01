# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
require File.expand_path(File.dirname(__FILE__) + "/environment")

# set :environment, Rails.env.to_sym
# /set :environment, :development
# env :PATH, ENV['PATH']
# set :environment, "development"
# set :output, { :error => "log/cron_error.log" }
# /set :path, "every 1.minutes do "
 set :output, "/Users/t-masato/Management-of-objects_app/log/cron.log"
#  /set :job_template, "/bin/zsh -l -c ':job'"
# /job_type :rake, "export PATH=\"$HOME/.rbenv/bin:$PATH\"; eval \"$(rbenv init -)\"; cd :path && RAILS_ENV=:environment bundle exec rake :task :output"
# /env 'LANG', 'ja_JP.UTF-8'
# /set :job_template, "/bin/zsh -c ':job'"
rails_env = ENV['RAILS_ENV'] || :development
set :environment, rails_env
#
#  every 1.minute do
#     rake 'roop:try'
#  end
#   rake "some:great:rake:task"
#   command "/usr/bin/some_great_command"
#
every 4.days do
  runner "AnotherModel.prune_old_records"
end

# Learn more: http://github.com/javan/whenever
