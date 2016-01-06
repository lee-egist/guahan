class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :origin

  validates :opinion, presence: true
  validates :user, presence: true
  validates :origin, presence: true
  validates :up_votes, presence: true, numericality: { greater_than_or_equal_to: 0}
  validates :down_votes, presence: true, numericality: { greater_than_or_equal_to: 0}
end
