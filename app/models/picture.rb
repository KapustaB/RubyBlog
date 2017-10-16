class Picture < ApplicationRecord
  belongs_to :post

  mount_uploader :coverpath, ImageUploader
end
