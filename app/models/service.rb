# frozen_string_literal: true

# Home services
class Service < ActiveRecord::Base
  include ServiceConcern

  default_scope { order(position: :asc) }

  validates :name, presence: true
  validates :position, presence: true, numericality: { greater_than: 0, only_integer: true }
  validates :image, presence: true
end
