class Origin < ActiveRecord::Base

  belongs_to :word
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :story, presence: true, uniqueness: true
  validates :word, presence: true
  validates :user, presence: true
  validates :endorsements, presence: true, numericality: { greater_than_or_equal_to: 0}
end
