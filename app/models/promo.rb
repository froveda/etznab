# frozen_string_literal: true

# Home promos
class Promo < ActiveRecord::Base
  include PromoConcern

  default_scope { order(position: :asc) }

  validates :name, presence: true
  validates :image, presence: true
  validates :position, presence: true, numericality: { greater_than: 0, only_integer: true }
end
