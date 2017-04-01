class Photo < ActiveRecord::Base
  
  default_scope -> { order(created_at: :desc) }
  belongs_to :user
  mount_uploader :pic, AvatarUploader

  validates :pic, presence: true
  validates :name, presence: true
end
