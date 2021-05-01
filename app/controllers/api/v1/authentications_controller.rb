module Api
  module V1
    class AuthenticationsController < ApiController
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

      def register
        user = User.create!(_user_params)
        render :json => { :user => user }, :status => :created
      end

      private

      def _user_params
        params.require(:user).permit(:name, :email, :password)
      end
    end
  end
end
