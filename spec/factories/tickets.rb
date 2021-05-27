FactoryBot.define do
  factory :ticket, class: Ticket  do
    sequence(:name) { |n| "Ticket#{n}" }
    date { DateTime.now }
    card_type { 'debit' }
    provider { 'Visa' }
    amount { Faker::Number.positive }
    sequence(:receipt_number) { |n| n }
  end
end
