class MessagesController < ApplicationController
  def index
    @messages = current_user.received_messages
  end

  def show
    @message = Message.find_by_id(params[:id])

    if @message.read_at.nil?
      @message.read_at = Time.now
      @message.save!
    else
      redirect_to root_path, flash: { notice: 'You can read this message only one time' }
    end
  end

  def create
    receiver = User.find_by_email(params[:email])
    message = Message.new
    message.subject = params[:subject]
    message.body = params[:body]
    message.sender_id = current_user.id
    message.recipent_id = receiver.id
    message.save!
    redirect_to root_path, flash: { notice: 'Message is sent successfully' }
  end
end
