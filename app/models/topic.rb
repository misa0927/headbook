class Topic < ActiveRecord::Base
  validates :title,:content, :image, presence: true
  belongs_to :user
  has_many :comments,dependent: :destroy
  mount_uploader :image, ImageUploader
end
