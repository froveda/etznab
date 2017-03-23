require'rails_helper'

describe Ticket do
  it "has a valid factory" do
    expect(build(:ticket)).to be_valid
  end

  describe "without a name" do
    let(:object) { build(:ticket, name: nil) }
    it_behaves_like "validating presence", :name
  end

  describe "without a card" do
    let(:object) { build(:ticket, card: nil) }
    it_behaves_like "validating presence", :card
  end

  describe "without a card_type" do
    let(:object) { build(:ticket, card_type: nil) }
    it_behaves_like "validating presence", :card_type
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

  describe "with an invalid card" do
    let(:object) { build(:ticket, card: 'test') }
    it_behaves_like "validating that it is included in the list of values", :card
  end

  describe "with an invalid card_type" do
    let(:object) { build(:ticket, card_type: 'test') }
    it_behaves_like "validating that it is included in the list of values", :card_type
  end

  describe "with a not number receipt_number" do
    let(:object) { build(:ticket, receipt_number: 'a') }
    it_behaves_like "validating that is a number", :receipt_number
  end

  it "it has unique receipt_number" do
    create(:ticket, receipt_number: '500')
    ticket_invalid = build(:ticket, receipt_number: '500')
    expect(ticket_invalid).to_not be_valid
    expect(ticket_invalid.errors[:receipt_number]).to include("ya está en uso")
  end
end