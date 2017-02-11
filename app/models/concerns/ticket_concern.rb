module TicketConcern
  extend ActiveSupport::Concern

  included do
    # Rails admin helper methods
    def card_enum
      [['Débito', 'debit'],['Crédito', 'credit']]
    end

    def card_type_enum
      CardType.all.map(&:name)
    end

    rails_admin do
      object_label_method :receipt_number

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
end