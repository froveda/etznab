class Ticket
  include Mongoid::Document
  include Mongoid::Timestamps

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
  validates :receipt_number, uniqueness: true

  # Rails admin helper methods
  def card_enum
    [['Débito', 'debit'],['Crédito', 'credit']]
  end

  def card_type_enum
    CardType.all.map(&:name)
  end

  rails_admin do
    list do
      field :receipt_number
      field :name
      field :date
      field :card
      field :card_type
      field :amount
      sort_by :receipt_number
      items_per_page 20
    end

    show do
      field :receipt_number
      field :name
      field :date
      field :card
      field :card_type
      field :amount
      field :payment_count
      field :payment_batch
      field :payment_coupon
      field :credit_card_last_digits
    end

    export do
      field :receipt_number
      field :name
      field :date
      field :card
      field :card_type
      field :amount
      field :payment_count
      field :payment_batch
      field :payment_coupon
      field :credit_card_last_digits
    end
  end
end