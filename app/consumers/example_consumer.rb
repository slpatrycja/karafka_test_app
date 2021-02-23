# frozen_string_literal: true

class ExampleConsumer < ApplicationConsumer
  def consume
    puts params.payload['counter']
  end
end
