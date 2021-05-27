# frozen_string_literal: true

# Rails Admin concerns for Instagram Images
module InstagramImageConcern
  extend ActiveSupport::Concern

  included do
    rails_admin do
      list do
        field :thumbnail_src_image do
          pretty_value do
            bindings[:view].tag(:img, { src: bindings[:object].thumbnail_src_image, style: 'width: 150px' })
          end
        end
        field :show, :toggle
        field :post_date
        sort_by :post_date
        items_per_page 20
      end

      show do
        field :thumbnail_src_image
        field :show
      end

      export do
        field :thumbnail_src_image
        field :show
      end

      edit do
        field :show
      end
    end
  end
end
