module ApplicationHelper
  
  # If controller is admin?
  def admin_namespace?
    controller.class.name.split('::').first == 'Admin'
  end
  
  def leaves_balances(type_id)
    balance_instance =  Leavebalance.find_by_user_id_and_leave_type_id(current_user.id,type_id)
    balance_instance ?  balance_instance.balance : 0
  end
  
  def admin_links
    ['Bank', 'Band', 'Designation', 'EmpType', 'Holiday', 'LeaveType', 'Project', 'User']
  end
  
  def moderator_links
    # TODO
  end
  
  def ctrl_klassname
    controller.class.name.split('::').last.gsub('Controller', '').downcase
  end
  
end
