class Image < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  belongs_to :word
  belongs_to :user

  validates :user, presence: true
  validates :word, presence: true
  validates :image, presence: true

end
