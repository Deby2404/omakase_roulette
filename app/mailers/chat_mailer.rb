class ChatMailer < ApplicationMailer
  default from: 'dedede2404@gmail.com'

    def send_when_admin_reply(customer, contact) #メソッドに対して引数を設定
    @customer = customer #ユーザー情報
    @answer = contact.reply #返信内容
    mail to: customer.email, subject: 'お問い合わせありがとうございます'
    end
end
