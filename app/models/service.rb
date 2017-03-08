class Service
  include Mongoid::Document
  include Mongoid::Timestamps

  default_scope { order(position: :asc) }

  include ServiceConcern

  field :name, type: String
  field :position, type: Integer
  field :description, type: String
  mount_uploader :image, ImageUploader

  validates :name, presence: true
  validates :position, presence: true, numericality: { greater_than: 0, only_integer: true }
  validates :image, presence: true
end