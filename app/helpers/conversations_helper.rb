module ConversationsHelper
  def admin
    @users.find_by(admin:true)
  end 
end