class Promo
  include Mongoid::Document
  include Mongoid::Timestamps

  default_scope { order(position: :asc) }

  include PromoConcern

  field :name, type: String
  field :position, type: Integer
  mount_uploader :image, ImageUploader

  validates_presence_of :name, :position
  validates_numericality_of :position, greater_than: 0, only_integer: true
end