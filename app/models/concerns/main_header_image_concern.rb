module MainHeaderImageConcern
  extend ActiveSupport::Concern

  included do
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
end