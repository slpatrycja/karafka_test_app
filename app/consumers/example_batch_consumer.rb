# frozen_string_literal: true

class ExampleBatchConsumer < ApplicationConsumer
  def consume
    # You can access the params_batch as an array and just work with it
    sum = params_batch.map { |param| param.payload['number'] }.inject(0) { |accu, val| accu + val }

    Karafka.logger.info "Sum of #{params_batch.count} elements equals to: #{sum}"
  end
end
