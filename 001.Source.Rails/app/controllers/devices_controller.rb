class DevicesController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:create]

  def new
    @device = Device.new
  end

  def create
    begin
      result = 0
      device = Device.find_or_initialize_by(uuid: params[:uuid])
      device.save!
    rescue Exception => e
      logger.debug e.message
      logger.debug e.backtrace.join("\n")
      result = 202
    ensure
      render json: {"result" => result}
    end
  end
end
