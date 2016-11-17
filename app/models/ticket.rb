class Ticket
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :date, type: DateTime
  field :card, type: String
  field :card_type, type: String
  field :amount, type: Float
  field :payment_amount, type: Integer
  field :payment_batch, type: String
  field :payment_coupon, type: String
  field :receipt_number, type: Integer
  field :credit_card_last_digits, type: Integer
end