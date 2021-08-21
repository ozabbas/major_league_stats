class SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      jwt = JWT.encode(
        {
          id: user.id, # the data to encode
          exp: 24.hours.from_now.to_i # the expiration time
        },
        "random", # the secret key
        'HS256' # the encryption algorithm
      )
      render json: {jwt: jwt, id: user.id}, status: :created
    else
      render json: {}, status: :unauthorized
    end
  end

  def user_authenticate
    token = request.headers["Authorization"]
    decoded_array = JWT.decode(token, "random", true, { algorithm: 'HS256' })

    render json: decoded_array[0]
  end
  
end