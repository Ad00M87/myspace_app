class Post < ApplicationRecord
  belongs_to :user
  has_attached_file :img
  validates_attachment_content_type :img, content_type: /\Aimage\/.*\z/
  
  def self.random_users(ids)
    friended = ids.any? ? ids : [0]
    where("id NOT IN (?)", friended).order("RANDOM()")
  end

  def self.friended(ids)
    friended = ids.any? ? ids : [0]
    where("id IN (?)", friended)
  end

end
