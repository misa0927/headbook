class NoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail_topic.subject
  #
  def sendmail_topic(topic)
    @topic = topic

    mail to: "misatatesawa@gmail.com",
    subject: '【 headbook 】トピックが投稿されました'
  end

  def sendmail_contact(contact)
    @contact = contact

    mail to:@contact.email,
         subject: '【 headbook 】お問い合わせが完了しました'
  end

end
