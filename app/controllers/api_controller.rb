class ApiController < ApplicationController
  def status_check
    render :json => {}, :status => :ok
  end
end
