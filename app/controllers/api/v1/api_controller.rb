module Api
  module V1
    class ApiController < ApplicationController
      before_action :_authenticate_request

      attr_reader :current_user

      private

      def _unauthorized
        render :json => { :error => 'Not Authorized' }, :status => :unauthorized
      end

      def _authenticate_request
        @current_user = AuthenticationService.user_if_authorized(request.headers)

        return _unauthorized unless @current_user
      end
    end
  end
end
