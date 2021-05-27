module TicketConcern
  extend ActiveSupport::Concern

  included do
    # Rails admin helper methods
    def card_type_enum
      [['Débito', 'debit'],['Crédito', 'credit']]
    end

    def provider_enum
      Ticket::CARD_PROVIDERS
    end

    rails_admin do
      object_label_method :receipt_number

      list do
        field :receipt_number
        field :name
        field :date
        field :card_type
        field :provider
        field :amount
        sort_by :receipt_number
        items_per_page 20
      end

      show do
        field :receipt_number
        field :name
        field :date
        field :card_type
        field :provider
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
        field :card_type
        field :provider
        field :amount
        field :payment_count
        field :payment_batch
        field :payment_coupon
        field :credit_card_last_digits
      end
    end
  end
end
