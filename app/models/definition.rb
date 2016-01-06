class Definition < ActiveRecord::Base
  belongs_to :word
  belongs_to :user

  validates :word, presence: true
  validates :explaination, presence: true
  validates :user, presence: true
end
