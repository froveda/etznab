# frozen_string_literal: true

# Services table create migration
class CreateServices < ActiveRecord::Migration[5.0]
  def change
    create_table :services do |t|
      t.string :name
      t.integer :position
      t.string :description
      t.string :image
    end
  end
end
