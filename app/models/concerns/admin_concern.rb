# frozen_string_literal: true

# Rails Admin concerns for Admins
module AdminConcern
  extend ActiveSupport::Concern

  included do
    rails_admin do
      object_label_method :email

      list do
        field :email
        items_per_page 20
      end

      show do
        field :email
      end

      export do
        field :email
      end

      edit do
        field :email
        field :password
      end
    end
  end
end
