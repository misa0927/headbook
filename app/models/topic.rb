class Topic < ActiveRecord::Base
  validates :title,:content, :image, presence: true
  belongs_to :user
  mount_uploader :image, ImageUploader
end
