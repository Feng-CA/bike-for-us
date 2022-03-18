class MessagesController < ApplicationController
  before_action do
    @conversation = Conversation.find(params[:conversation_id])
  end

  def index
    # SELECT * FROM messages table WHERE conversationID = value;
    @messages = @conversation.messages
    @message = @conversation.messages.new
  end
  
  def new
    @message = @conversation.messages.new
  end

  # INSERT INTO messages table (column1, ...) VALUES (value1, ...)
  def create
    @message = @conversation.messages.new(message_params)
    if @message.save
      redirect_to conversation_messages_path(@conversation)
    end
  end
  private
  def message_params
    params.require(:message).permit(:body, :user_id)
  end
end
