require'rails_helper'

describe Admin do
  subject(:admin) { build(:admin_with_password) }

  it { is_expected.to be_valid }

  describe "validations" do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_length_of(:password).is_at_least(6) }
  end

  describe "is invalid without an email" do
    let(:object) { build(:admin_with_password, email: nil) }
    it_behaves_like "validating presence", :email
  end

  describe "with a wrong formatted email" do
    let(:object) { build(:admin_with_password, email: 'wrongemail') }
    it_behaves_like "validating format", :email
  end

  it "is invalid with a repeated email" do
    create(:admin_with_password, email: 'email@example.com')
    invalid_admin = build(:admin_with_password, email: 'email@example.com')
    expect(invalid_admin).to_not be_valid
    expect(invalid_admin.errors[:email]).to include("ya está en uso")
  end

  describe "is invalid without a password" do
    let(:object) { build(:admin) }
    it_behaves_like "validating presence", :password
  end

  it "is invalid with a short password" do
    admin = build(:admin, password: 'pass', password_confirmation: 'pass')
    expect(admin).to_not be_valid
    expect(admin.errors[:password]).to include("es demasiado corto (6 caracteres mínimo)")
  end
end
