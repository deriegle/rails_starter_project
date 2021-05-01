module Api
  module V1
    class StatusController < ApiController
      skip_before_action :_authenticate_request, :only => [:status_check]

      def status_check
        render :json => {}, :status => :ok
      end
    end
  end
end
