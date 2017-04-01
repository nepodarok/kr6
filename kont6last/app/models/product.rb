class Product < ActiveRecord::Base

  default_scope -> { order(created_at: :desc) }

  belongs_to :category
  belongs_to :user

  validates :name, presence: true, length: { minimum: 3, maximum: 255 }
  validates :category_id, presence: true
  validates :user_id, presence: true
  validates :content, presence: true, length: { minimum: 3 }
  validates :contacts, presence: true

end
