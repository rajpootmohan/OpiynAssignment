class Review < ActiveRecord::Base
  attr_accessible :id, :content, :created_at
  self.primary_key = :id
  belongs_to :item, :foreign_key => :item_id, :primary_key => :id

end
