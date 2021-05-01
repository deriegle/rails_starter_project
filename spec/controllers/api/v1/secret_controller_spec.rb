require "rails_helper"

RSpec.describe Api::V1::SecretController, type: :controller do
  describe "#index" do
    context "with a valid auth token" do
      include_context :with_valid_auth_token

      it "works" do
        get :index

        expect(response).to have_http_status(:ok)
        expect(json_body["user"]).not_to be_nil
      end
    end

    context "without auth token" do
      it "is unauthorized" do
        get :index

        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end

