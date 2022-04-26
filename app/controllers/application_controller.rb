class ApplicationController < ActionController::API
  def bad_request
    render json: {message: 'Request Invalid: Please check paramters and try again'}, status: :bad_request

  end
end
