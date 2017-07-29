class Word < ActiveRecord::Base

  belongs_to :alphabet
  belongs_to :user

  has_many :origins, dependent: :destroy
  has_many :comments, through: :origins

  has_many :definitions, dependent: :destroy
  has_many :pronunciations, dependent: :destroy
  has_many :examples, dependent: :destroy
  has_many :images, dependent: :destroy

  validates :spelling, presence: true, uniqueness: true
  validates :alphabet, presence: true
  validates :user, presence: true
end
