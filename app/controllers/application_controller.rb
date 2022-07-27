class ApplicationController < ActionController::API

  def bad_request
    render json: {message: 'Request Invalid: Please check paramters and try again'}, status: 400
  end

    def current_user
    if session[:current_user]
      @current_user = User.find(session[:user_id])
    end
  end

  def authorize
    if !current_user
      render json: {message: "Unauthorized: Please log in first"}, status: 401
    end
  end
end
