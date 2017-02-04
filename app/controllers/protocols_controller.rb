class ProtocolsController < ApplicationController
  expose :protocol, -> { current_user.protocol || current_user.build_protocol }

  def create
    return render :new unless protocol.update(protocol_params)
    redirect_to user_path(current_user)
    LoginJob.perform_later(protocol)
  end

  def update
    create
  end

  private

  def protocol_params
    params.require(:protocol).permit!
  end
end
