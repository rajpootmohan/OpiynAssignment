class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews, id: false do |t|
      t.string :id
      t.string :item_id
      t.string :content
      t.datetime :created_at
    end
  end
end
