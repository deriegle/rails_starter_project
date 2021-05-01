module Api
  module V1
    class SecretController < ApiController
      def index
        render :json => { :user => current_user }
      end
    end
  end
end
