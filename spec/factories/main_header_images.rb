FactoryGirl.define do
  factory :main_header_image, class: MainHeaderImage  do
    sequence(:position) { |n| n }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'sample.jpg')) }
  end
end