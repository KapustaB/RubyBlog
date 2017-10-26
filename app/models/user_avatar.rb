class UserAvatar < ApplicationRecord
  belongs_to :user
 # mount_uploader :coverpath, ImageUploader
end
