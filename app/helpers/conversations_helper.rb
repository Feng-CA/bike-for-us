module ConversationsHelper
  def admin_user
    @users.find_by(admin:true)
  end 
end