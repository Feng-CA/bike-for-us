module ConversationsHelper
  def admin_id
    @users.find_by(admin:true).id
  end 
end