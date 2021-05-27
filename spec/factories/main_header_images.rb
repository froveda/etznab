FactoryBot.define do
  factory :main_header_image, class: MainHeaderImage  do
    position { Faker::Number.number(6) }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'sample.jpg')) }
  end
end
