# frozen_string_literal: true

FactoryBot.define do
  factory :service, class: Service do
    sequence(:name) { |n| "Service#{n}" }
    position { Faker::Number.number(6) }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'sample.jpg')) }
  end
end
