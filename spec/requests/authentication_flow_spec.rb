require "rails_helper"

RSpec.describe "Authentication Flow" do
  it "allows user to register and sign in" do
    # Cannot access until authenticated
    get "/api/v1/secret"

    expect(response).to have_http_status(:unauthorized)

    post "/api/v1/authentication/register", :params => {
      :user => {
        :name => "Fake User",
        :email => "d@d.d",
        :password => "password123456"
      }
    }
    
    expect(response).to have_http_status(:created)

    user = json_body["user"]

    expect(user).not_to be_nil
    expect(user["id"]).not_to be_nil
    expect(user["name"]).to eq("Fake User")
    expect(user["email"]).to eq("d@d.d")

    # Returns 401 when given invalid credentials
    post "/api/v1/authentication/authenticate", :params => {
      :email => "d@d.d",
      :password => "wrong-password"
    }

    expect(response).to have_http_status(:unauthorized)
    expect(json_body["error"]).to eq("Invalid email or password")

    # Returns 200 and JWT when given valid credentials
    post "/api/v1/authentication/authenticate", :params => {
      :email => "d@d.d",
      :password => "password123456"
    }

    expect(response).to have_http_status(:ok)
    expect(json_body["token"]).not_to be_nil

    get "/api/v1/secret", :headers => {
      :Authorization => json_body["token"]
    }

    expect(response).to have_http_status(:ok)
    expect(json_body["user"]).not_to be_nil
  end
end
