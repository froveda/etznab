# frozen_string_literal: true

# Tickets to record sales
class Ticket < ActiveRecord::Base
  CARD_TYPES = %w[debit credit].freeze
  CARD_PROVIDERS = %w[Amex Cabal MasterCard Naranja Visa].freeze

  include TicketConcern

  validates :name, presence: true
  validates :date, presence: true
  validates :card_type, presence: true, inclusion: { in: CARD_TYPES }
  validates :provider, presence: true, inclusion: { in: CARD_PROVIDERS }
  validates :amount, presence: true
  validates :receipt_number, presence: true, uniqueness: true, numericality: { greater_than: 0, only_integer: true }
end
