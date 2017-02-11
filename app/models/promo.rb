class Promo
  include Mongoid::Document
  include Mongoid::Timestamps

  default_scope { order(position: :asc) }

  field :name, type: String
  field :position, type: Integer
  mount_uploader :image, ImageUploader

  validates_presence_of :name, :position
  validates_numericality_of :position, greater_than: 0, only_integer: true

  rails_admin do
    object_label_method :image

    list do
      field :name
      field :position
      sort_by :position
      items_per_page 20
    end

    show do
      field :name
      field :position
    end

    export do
      field :name
      field :position
    end

    edit do
      field :name
      field :position
      field :image, :carrierwave
    end
  end
end