FactoryBot.define do
  factory :promo, class: Promo  do
    sequence(:name) { |n| "Promo#{n}" }
    position { Faker::Number.number(6) }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'sample.jpg')) }
  end
end
