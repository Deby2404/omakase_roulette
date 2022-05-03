class ChatMailer < ApplicationMailer
  default from: 'dedede2404@gmail.com', subject: '管理者より'
  def send_mail(customer,message)
    @customer = customer
    @message = message
    mail to: customer.email
  end
end
