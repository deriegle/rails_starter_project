RSpec.shared_context :with_valid_auth_token, :shared_context => :metadata do
  let(:user) { create(:user) }
  let(:token) { AuthenticationService.generate_token(user.id) }

  before do
    request.headers["Authorization"] = token
  end
end
