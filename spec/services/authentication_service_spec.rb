require 'rails_helper'

RSpec.describe AuthenticationService do
  let(:user) { create(:user) }

  describe "authenticate_user" do
    let(:email) { nil }
    let(:password) { nil }
    let(:result) { described_class.authenticate_user(email, password) }

    context "when user exists" do
      let(:email) { user.email }
      let(:password) { user.password }

      it { expect(result).to eq(user) }

      context "when email is wrong" do
        let(:email) { "wrongemail@example.com" }

        it { expect(result).to eq(nil) }
      end

      context "when password is wrong" do
        let(:password) { "292939i3939" }

        it { expect(result).to eq(nil) }
      end
    end

    context "when user does not exists" do
      it { expect(result).to be_nil }
    end
  end

  describe "generate_token" do
    it "works" do
      result = described_class.generate_token(user.id)

      expect(result).not_to eq(nil)
    end
  end

  describe "user_if_authorized" do
    let(:result) { described_class.user_if_authorized(headers) }

    context "when not given headers" do
      let(:headers) { nil }

      it { expect(result).to eq(nil) }
    end

    context "when given headers" do
      context "when valid token" do
        let(:token) { described_class.generate_token(user.id) }
        let(:headers) do
          HashWithIndifferentAccess.new(
            'Authorization': token
          )
        end

        it { expect(result).to eq(user) }
      end

      context "when invalid token" do
        let(:token) { described_class.generate_token('1929339') }
        let(:headers) do
          HashWithIndifferentAccess.new(
            'Authorization': token
          )
        end

        it { expect(result).to eq(nil) }
      end
    end
  end
end
