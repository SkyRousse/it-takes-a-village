class User < ApplicationRecord
  has_secure_password
  has_many :pets
  validates :password, :length => { :minimum => 8 }, :if => :password
  validates :email, :presence => true, :uniqueness => true
  before_save :downcase_fields

  def downcase_fields
     self.email.downcase!
  end
end
