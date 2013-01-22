class Bank < ActiveRecord::Base
  validates :name, :uniqueness => true
  validates :name, presence: true
  attr_accessible :name
end
