class InstagramImage
  include Mongoid::Document
  include Mongoid::Timestamps

  default_scope { order(post_date: :desc) }

  include InstagramImageConcern

  field :instagram_id, type: Integer
  field :code, type: String
  field :thumbnail_src, type: String
  field :display_src, type: String
  field :display_src_image, type: String
  field :thumbnail_src_image, type: String
  field :post_date, type: DateTime
  field :show, type: Boolean, default: true

  scope :show_enabled, -> { where(show: true) }
end