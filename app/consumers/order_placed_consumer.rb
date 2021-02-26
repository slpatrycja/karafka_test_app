# frozen_string_literal: true

class OrderPlacedConsumer < ApplicationConsumer
  def consume
    params_batch.each do |param|
      ::OrderConfirmationSender.call(param.payload['email'], param.payload['order_value'])
    end
  end
end
