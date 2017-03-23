require'rails_helper'

describe Service do
  it "has a valid factory" do
    expect(build(:service)).to be_valid
  end

  describe "without a name" do
    let(:object) { build(:service, name: nil) }
    it_behaves_like "validating presence", :name
  end

  describe "without a position" do
    let(:object) { build(:service, position: nil) }
    it_behaves_like "validating presence", :position
  end

  describe "without a image" do
    let(:object) { build(:service, image: nil) }
    it_behaves_like "validating presence", :image
  end

  describe "with position lower than 1" do
    let(:object) { build(:service, position: 0) }
    it_behaves_like "validating number greater than a count", :position, 0
  end

  describe "with a not number position" do
    let(:object) { build(:service, position: 'a') }
    it_behaves_like "validating that is a number", :position
  end
end