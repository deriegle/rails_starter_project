require 'rails_helper'

RSpec.describe Api::AuthenticationController, type: :controller do
  describe "#authenticate" do
    let(:user) { create(:user) }
    let(:email) { user.email }
    let(:password) { user.password }

    before do
      post :authenticate, :params => {
        :email => email,
        :password => password
      }
    end

    context "when email and password are correct" do
      it "returns a token" do
        expect(response).to have_http_status(:ok)
        expect(json_body["token"]).not_to eq(nil)
      end
    end

    context "when email is not given" do
      let(:email) { nil }

      it "is unauthorized" do
        expect(response).to have_http_status(:unauthorized)
        expect(json_body["error"]).to eq("Invalid email or password")
      end
    end

    context "when password is not given" do
      let(:password) { nil }

      it "is unauthorized" do
        expect(response).to have_http_status(:unauthorized)
        expect(json_body["error"]).to eq("Invalid email or password")
      end
    end

    context "when password is incorrect" do
      let(:password) { "abdjd#{user.password}29929" }

      it "is unauthorized" do
        expect(response).to have_http_status(:unauthorized)
        expect(json_body["error"]).to eq("Invalid email or password")
      end
    end
  end

  describe "#register" do
    let(:params) { { :user => user } }
    let(:user) do
      {
        :email => email,
        :password => password,
        :name => name
      }
    end

    context "with valid params" do
      let(:name) { nil }
      let(:password) { Faker::Internet.password }
      let(:email) { Faker::Internet.email }

      it "creates a new user" do
        expect { post :register, :params => params }.to change { User.count }.by(1)
      end
    end

    context "with invalid params" do
      let(:name) { nil }
      let(:password) { nil }
      let(:email) { nil }

      it "raises an error and does not create a user" do
        expect { post :register, :params => params }.to raise_error(ActiveRecord::RecordInvalid)

        expect do
          post :register, :params => params rescue nil
        end.not_to change { User.count }
      end
    end
  end
end
