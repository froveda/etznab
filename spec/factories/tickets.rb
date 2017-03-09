FactoryGirl.define do
  factory :ticket, class: Ticket  do
    sequence(:name) { |n| "Ticket#{n}" }
    date DateTime.now
    card 'debit'
    card_type 'visa'
    amount Faker::Number.positive
    sequence(:receipt_number) { |n| n }
  end
end