class Leavemanagement < ActiveRecord::Base
  
  attr_accessible :approved, :end_date, :reason, :start_date, :type, :user_id , :leave_type_id
  
  validates :start_date,:leave_type_id,:user_id , :presence => true
  
  belongs_to :leave_type
  belongs_to :user
  
end
