FactoryBot.define do
  factory :admin do
    email                   { Faker::Internet.email }
  end

  factory :admin_with_password, parent: :admin do
    after(:build) { |u| u.password_confirmation = u.password = 'some_password' }
  end
end
