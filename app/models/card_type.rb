class CardType
  include Mongoid::Document
  include Mongoid::Timestamps

  default_scope { order(name: :asc) }

  field :name, type: String

  validates :name, presence: true, uniqueness: true

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