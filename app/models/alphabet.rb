class Alphabet < ActiveRecord::Base
  has_many :words, dependent: :destroy

  validates :letter, presence: true, uniqueness: true
end
