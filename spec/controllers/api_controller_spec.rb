require 'rails_helper'

RSpec.describe ApiController, type: :controller do
  describe "#status_check" do
    it "is ok" do
      get :status_check

      expect(response).to have_http_status(:ok)
    end
  end
end
