# frozen_string_literal: true

namespace :waterdrop do
  desc 'Generates messages to Kafka server'
  task :send do
    message = { 'counter' => 0 }.to_json
    WaterDrop::SyncProducer.call(message, topic: 'example')

    10.times do
      message = { 'number' => rand }.to_json
      # @note You can send messages with async producer as well
      WaterDrop::AsyncProducer.call(message, topic: 'example_batch')
    end
  end
end
