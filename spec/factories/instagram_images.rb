FactoryGirl.define do
  factory :instagram_image do
    sequence(:instagram_id) { |n| n }
    sequence(:code) { |n| "instagramcode#{n}" }
    thumbnail_src { Faker::Internet.url('example.com', '/image.jpg') }
  end
end