FactoryGirl.define do
  factory :admin do
    email     { Faker::Internet.email }
    password              'some_password'
    password_confirmation 'some_password'
  end
end