class MessagesController < ApplicationController
  def index
    @messages = current_user.received_messages
  end

  def show
    @message = Message.find_by_id(params[:id])
  end
end
