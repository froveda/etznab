class CreateInstagramImage < ActiveRecord::Migration[5.0]
  def change
    create_table :instagram_images do |t|
      t.integer     :instagram_id
      t.string      :code
      t.string      :thumbnail_src
      t.string      :display_src
      t.string      :display_src_image
      t.string      :thumbnail_src_image
      t.datetime    :post_date
      t.boolean     :show, default: true
      t.string      :video_url
      t.boolean     :is_video
    end

    add_index :instagram_images, [:instagram_id, :code], unique: true
  end
end
