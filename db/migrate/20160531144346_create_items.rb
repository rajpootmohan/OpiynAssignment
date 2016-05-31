class CreateItems < ActiveRecord::Migration
  def change
    create_table :items, id: false do |t|
      t.string :id
      t.string :title
      t.string :image_url
      t.integer :review_counter
      t.datetime :created_at
    end
  end
end
