class MessagesController < ApplicationController

  def create
    @message = Message.new(message_params)
    if @message.save
      flash[:notice] = "Nachricht gesendet"
      redirect_to contact_path
    else
      flash[:error] = "Leider ist etwas schief gelaufen"
      redirect_to contact_path
    end
  end

  private

  def message_params
    params.require(:message).permit!
  end

end
