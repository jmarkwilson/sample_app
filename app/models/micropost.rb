class Micropost < ActiveRecord::Base
  attr_accessible :content
#  attr_protected :user_id
  belongs_to :user

  validates :user_id, presence: true
end
