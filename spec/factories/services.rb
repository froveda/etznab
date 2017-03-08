FactoryGirl.define do
  factory :service, class: Service  do
    sequence(:name) { |n| "Service#{n}" }
    sequence(:position) { |n| n }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'sample.jpg')) }
  end
end