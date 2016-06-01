class InsertItemAndReveiwsData < ActiveRecord::Migration
  def up
    15.times.each do |i|
      item = Item.create(id:"c5e18c83-96d8-4a1f-a446-d6bf8a178ec7#{i}", title:"Cafe Coffee Day#{i}", image_url: "https://opiyn.ur1#{i}")
      (i+7).times.each do |j|
        review = Review.new(id: "48c5b3ec-5db1-4ca0-9a62-55f6bfea6b61#{j}", content: "great cofee#{j}", created_at: Time.now+j.to_i.minutes)
        review.item = item
        review.save!
      end
    end
  end

  def down
  end
end
