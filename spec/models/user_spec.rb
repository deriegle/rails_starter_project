require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_length_of(:name).is_at_least(5) }
  it { should validate_length_of(:password).is_at_least(6) }
  it { should have_secure_password }
end
