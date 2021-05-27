require'rails_helper'

describe Ticket do
  subject(:ticket) { build(:ticket) }

  it { is_expected.to be_valid }

  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:card_type) }
    it { is_expected.to validate_presence_of(:provider) }
    it { is_expected.to validate_presence_of(:amount) }
    it { is_expected.to validate_presence_of(:receipt_number) }
    it { is_expected.to validate_uniqueness_of(:receipt_number) }
    it { is_expected.to validate_numericality_of(:receipt_number).is_greater_than(0).only_integer }
    it { is_expected.to validate_inclusion_of(:card_type).in_array(Ticket::CARD_TYPES) }
    it { is_expected.to validate_inclusion_of(:provider).in_array(Ticket::CARD_PROVIDERS) }
  end

  describe "without a name" do
    let(:object) { build(:ticket, name: nil) }
    it_behaves_like "validating presence", :name
  end

  describe "without a card_type" do
    let(:object) { build(:ticket, card_type: nil) }
    it_behaves_like "validating presence", :card_type
  end

  describe "without a provider" do
    let(:object) { build(:ticket, provider: nil) }
    it_behaves_like "validating presence", :provider
  end

  describe "without a amount" do
    let(:object) { build(:ticket, amount: nil) }
    it_behaves_like "validating presence", :amount
  end

  describe "without a receipt_number" do
    let(:object) { build(:ticket, receipt_number: nil) }
    it_behaves_like "validating presence", :receipt_number
  end

  describe "with receipt_number lower than 1" do
    let(:object) { build(:ticket, receipt_number: 0) }
    it_behaves_like "validating number greater than a count", :receipt_number, 0
  end

  describe "with a not number receipt_number" do
    let(:object) { build(:ticket, receipt_number: 'a') }
    it_behaves_like "validating that is a number", :receipt_number
  end

  describe "with an invalid card_type" do
    let(:object) { build(:ticket, card_type: 'test') }
    it_behaves_like "validating that it is included in the list of values", :card_type
  end

  describe "with an invalid provider" do
    let(:object) { build(:ticket, provider: 'test') }
    it_behaves_like "validating that it is included in the list of values", :provider
  end

  it "it has unique receipt_number" do
    create(:ticket, receipt_number: '500')
    ticket_invalid = build(:ticket, receipt_number: '500')
    expect(ticket_invalid).to_not be_valid
    expect(ticket_invalid.errors[:receipt_number]).to include("ya está en uso")
  end
end
