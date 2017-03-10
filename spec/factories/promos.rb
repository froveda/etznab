FactoryGirl.define do
  factory :promo, class: Promo  do
    sequence(:name) { |n| "Promo#{n}" }
    sequence(:position) { |n| n }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'sample.jpg')) }
  end
end