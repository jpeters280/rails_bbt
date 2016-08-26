class User < ActiveRecord::Base
	has_many :groups
  	has_many :likes, dependent: :destroy
  	has_many :memberships
  	has_many :groups_joined, through: :memberships, source: :group
  	email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  	validates :first_name, :presence => true
  	validates :last_name, :presence => true
  	validates :email, :presence => true, :uniqueness => { case_sensitive: false }, :format => { :with => email_regex }
  	has_secure_password
end
