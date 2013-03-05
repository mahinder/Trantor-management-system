class LeaveType < ActiveRecord::Base
  attr_accessible :name
  validates :name , :uniqueness => true
  has_many :uses, :through => :leavebalance
end
