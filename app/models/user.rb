# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  has_secure_password
  
  before_save { |user| user.email = email.downcase }
  validates :name, presence: true, length: { maximum: 51 },  length: { :minimum => 3 }
  VALID_EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates :email, presence: true, 
                    format: { with: VALID_EMAIL_REGEX }, 
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true                  
  #validates :terms, :acceptance => true
  #validates :password, :confirmation => true
  #validates :username, :exclusion => { :in => %w(admin superuser) }
  #validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create }
  #validates :age, :inclusion => { :in => 0..9 }
  #validates :first_name, :length => { :maximum => 30 }
  #validates :age, :numericality => true
  #validates :username, :presence => true
  #validates :username, :uniqueness => true
end