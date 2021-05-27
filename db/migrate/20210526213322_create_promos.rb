# frozen_string_literal: true

# Promos table create migration
class CreatePromos < ActiveRecord::Migration[5.0]
  def change
    create_table :promos do |t|
      t.string :name
      t.integer :position
      t.string :image
    end
  end
end
