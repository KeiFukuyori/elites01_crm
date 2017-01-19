class Comment < ActiveRecord::Base
  #commentは一人のcustomerに紐づいているので、belongs_toとなる
  belongs_to :customer
  
  validates :body, 
    presence: true, length: { maximum: 200 }
  validates :customer_id, presence: true
end
