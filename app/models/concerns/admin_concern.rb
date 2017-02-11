module AdminConcern
  extend ActiveSupport::Concern

  included do
    rails_admin do
      object_label_method :name

      list do
        field :name
        items_per_page 20
      end

      show do
        field :name
      end

      export do
        field :name
      end

      edit do
        field :name
      end
    end
  end
end