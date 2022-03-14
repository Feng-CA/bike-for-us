module ConversationsHelper
  def admin
    admin = @users.find_by(admin:true)
  end 
end