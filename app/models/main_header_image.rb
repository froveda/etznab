class MainHeaderImage
  include Mongoid::Document
  include Mongoid::Timestamps

  default_scope { order(position: :asc) }

  field :position, type: Integer
  mount_uploader :image, ImageUploader

  validates_presence_of :image, :position
  validates_numericality_of :position, greater_than: 0, only_integer: true

  rails_admin do
    object_label_method :image

    list do
      field :image
      field :position
      sort_by :position
      items_per_page 20
    end

    show do
      field :image
      field :position
    end

    export do
      field :image
      field :position
    end

    edit do
      field :image, :carrierwave
      field :position
    end
  end
end