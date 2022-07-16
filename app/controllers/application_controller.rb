class ApplicationController < ActionController::API
  def encode_token(payload)
    JWT.encode(payload, ENV['JWT_Secret'])
  end

  def decode_token
    # Get auth header
    auth_header = request.headers['Authorization']

    if auth_header
      # Gets the token value, excluding the 'Bearer'
      token = auth_header.split(' ').last
      begin
        # Returns the token
        JWT.decode(token, ENV['JWT_Secret'], true, algorithm: 'HS256')
      rescue JWT::DecodeError
        # Error handler
        render json: { msg: 'Token decode error' }
      end
    end
  end

  # This method checks whether the client is logged in or not
  def authorized_user
    # Gets the token
    decoded_token = decode_token

    if decoded_token
      # Sets the current user based on the provided token
      user_email = decoded_token[0]['user_email']
      @user = User.find_by(email: user_email)
    end
  end

  # Checks for logged user
  def authorize
    # Return when client is not logged in
    unless authorized_user
      render json: { msg: 'You have to be logged in to access this resource' }, status: :unauthorized
    end
  end
end
