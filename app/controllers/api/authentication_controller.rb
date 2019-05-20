class Api::AuthenticationController < ApiController
  skip_before_action :_authenticate_request

  def authenticate
    user = AuthenticationService.authenticate_user(
      params[:email],
      params[:password]
    )

    if user.present?
      token = AuthenticationService.generate_token(user.id)
      render :json => { :token => token }, :status => :ok
    else
      render :json => { :error => "Invalid email or password" }, :status => :unauthorized
    end
  end
end
