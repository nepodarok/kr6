class Photo < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  default_scope -> { order(created_at: :desc) }
  belongs_to :user
  mount_uploader :pic, AvatarUploader

  # validates :pic, presence: true
  validates :name, presence: true
end
