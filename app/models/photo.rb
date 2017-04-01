class Photo < ActiveRecord::Base
  belongs_to :user
  mount_uploader :pic, AvatarUploader
end
