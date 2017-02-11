module PromoConcern
  extend ActiveSupport::Concern

  included do
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
end