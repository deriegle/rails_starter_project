class ApiController < ApplicationController
  before_action :_authenticate_request
  skip_before_action :_authenticate_request, :only => [:status_check]
  attr_reader :current_user

  def status_check
    render :json => {}, :status => :ok
  end

  private

  def _authenticate_request
    @current_user = AuthenticationService.user_if_authorized(request.headers)

    render :json => {
      :error => 'Not Authorized'
    }, :status => :unauthorized unless @current_user
  end
end
