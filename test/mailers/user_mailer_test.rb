require "test_helper"

class UserMailerTest < ActionMailer::TestCase
  test "Deadline_notice" do
    mail = UserMailer.Deadline_notice
    assert_equal "Deadline notice", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
