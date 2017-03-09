class Ticket
  include Mongoid::Document
  include Mongoid::Timestamps

  include TicketConcern

  field :name, type: String
  field :date, type: DateTime
  field :card, type: String
  field :card_type, type: String
  field :amount, type: Float
  field :payment_count, type: Integer
  field :payment_batch, type: String
  field :payment_coupon, type: String
  field :receipt_number, type: Integer
  field :credit_card_last_digits, type: Integer

  validates_presence_of :name, :date, :card, :card_type, :amount, :receipt_number

  validates :card, inclusion: { in: %w(debit credit)}
  validates :card_type, inclusion: { in: %w(mastercard visa amex)}
  validates :receipt_number, uniqueness: true, numericality: { greater_than: 0, only_integer: true }
end