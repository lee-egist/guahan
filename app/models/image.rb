class Image < ActiveRecord::Base
  belongs_to :word
  belongs_to :user

  validates :user, presence: true
  validates :word, presence: true
  validates :image_url, presence: true

end
