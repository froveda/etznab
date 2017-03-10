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

  index({ instagram_id: 1, code: 1 }, { unique: true })

  scope :show_enabled, -> { where(show: true) }

  validates_presence_of :instagram_id, :code, :thumbnail_src
  validates_uniqueness_of :instagram_id, scope: :code
  validates_numericality_of :instagram_id
  validates_format_of :thumbnail_src, with: URI::regexp(%w(http https)), message: "debe ser una URL válida"
end