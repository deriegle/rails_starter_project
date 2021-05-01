require "rails_helper"

RSpec.describe JwtService do
  describe ".encode" do
    it "works" do
      payload = { user_id: "1234" }

      expect(described_class.encode(payload)).to be_a(String)
    end
  end

  describe ".decode" do
    it "works" do
      expect(described_class.decode(nil)).to be_nil
      expect(described_class.decode("fake-token")).to be_nil

      payload = { user_id: "1234" }
      expiration = 10.minutes.from_now
      token = described_class.encode(payload, :expiration => expiration)
      decoded_token = described_class.decode(token)

      expect(decoded_token.keys).to include("user_id", "exp")
      expect(decoded_token["user_id"]).to eq(payload[:user_id])
      expect(decoded_token["exp"]).to eq(expiration.to_i)
    end
  end
end
