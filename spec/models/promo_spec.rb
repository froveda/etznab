require'rails_helper'

describe Promo do
  it "has a valid factory" do
    expect(build(:promo)).to be_valid
  end

  describe "without a name" do
    let(:object) { build(:promo, name: nil) }
    it_behaves_like "validating presence", :name
  end

  describe "without a position" do
    let(:object) { build(:promo, position: nil) }
    it_behaves_like "validating presence", :position
  end

  describe "without a image" do
    let(:object) { build(:promo, image: nil) }
    it_behaves_like "validating presence", :image
  end

  describe "with position lower than 1" do
    let(:object) { build(:promo, position: 0) }
    it_behaves_like "validating integer higher than 0", :position
  end

  describe "with a not number position" do
    let(:object) { build(:promo, position: 'a') }
    it_behaves_like "validating that is a number", :position
  end
end