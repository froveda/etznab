FactoryBot.define do
  factory :instagram_image do
    instagram_id { Faker::Number.number(6) }
    sequence(:code) { |n| "instagramcode#{n}" }
    thumbnail_src { Faker::Internet.url('example.com', '/image.jpg') }
  end
end
