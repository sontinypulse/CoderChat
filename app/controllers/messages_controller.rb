class MessagesController < ApplicationController
  def index
    @messages = current_user.received_messages
  end

  def sent_messages
    @messages = current_user.sent_messages
  end

  def view_sent
    @message = Message.find_by_id(params[:id])
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
    email = params[:email] || params[:email_hidden]
    receiver = User.find_by_email(email)
    message = Message.new
    message.subject = params[:subject]
    message.body = params[:body]
    message.sender_id = current_user.id
    message.recipent_id = receiver.id
    message.save!
    redirect_to root_path, flash: { notice: "Message is sent successfully to #{receiver.first_name} #{receiver.last_name}" }
  end
end
