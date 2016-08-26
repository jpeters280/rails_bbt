class Group < ActiveRecord::Base
  belongs_to :user
  has_many :memberships
  has_many :members, through: :memberships, :source=> :user
  validates :org_name, presence: true, length: { minimum: 5 }
  validates :description, presence: true, length: { minimum: 10 }
end
