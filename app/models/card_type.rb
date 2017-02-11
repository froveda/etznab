class CardType
  include Mongoid::Document
  include Mongoid::Timestamps

  default_scope { order(name: :asc) }

  include CardTypeConcern

  field :name, type: String

  validates :name, presence: true, uniqueness: true
end