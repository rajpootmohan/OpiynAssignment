class Item < ActiveRecord::Base

  attr_accessible :id, :title, :image_url, :review_counter
  self.primary_key = :id
  has_many :reviews


end
