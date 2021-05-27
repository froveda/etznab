# frozen_string_literal: true

# Images for home Headers
class MainHeaderImage < ActiveRecord::Base
  include MainHeaderImageConcern

  default_scope { order(position: :asc) }

  validates :image, presence: true
  validates :position, presence: true, numericality: { greater_than: 0, only_integer: true }

  mount_uploader :image, ImageUploader
end
