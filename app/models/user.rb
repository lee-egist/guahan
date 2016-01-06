class User < ActiveRecord::Base

  has_secure_password

  validates :handle, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

end
