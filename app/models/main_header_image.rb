class MainHeaderImage
  include Mongoid::Document
  include Mongoid::Timestamps

  default_scope { order(position: :asc) }

  include MainHeaderImageConcern

  field :position, type: Integer
  mount_uploader :image, ImageUploader

  validates_presence_of :image, :position
  validates_numericality_of :position, greater_than: 0, only_integer: true
end