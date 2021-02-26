# frozen_string_literal: true

class OrderConfirmationSender
  SENDER_EMAIL = 'kafkashoppingcart@example.com'

  def self.call(email, value)
    mail = Mail.new do
      from     SENDER_EMAIL
      to       email
      subject  'Your order has been placed'
      body     "Your order has been successfully placed. Please give us money: #{value}. Thanks!"
    end

    mail.deliver!
  end
end
