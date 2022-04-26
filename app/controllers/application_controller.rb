class ApplicationController < ActionController::API
  def bad_request
    render json: {message: 'Request Invalid: Please check paramters and try again'}, status: 400
  end
end
