class CreateMainHeaderImages < ActiveRecord::Migration[5.0]
  def change
    create_table :main_header_images do |t|
      t.integer :position
      t.string :image
    end
  end
end
