class ApplicationController < ActionController::API
  acts_as_token_authentication_handler_for User, fallback: :none
  respond_to :json
  
  def bad_request
    render json: {message: 'Request Invalid: Please check paramters and try again'}, status: 400
  end

  def authorize
    if current_user.authentication_token.nil?
      render json: {message: 'Please sign In'}, status: 401
    end 
  end 
end
