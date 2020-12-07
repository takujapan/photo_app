class CreatePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :photos do |t|
      t.integer :user_id
      t.text :caption
      t.string :image_id

      t.timestamps
    end
  end
end
