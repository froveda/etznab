require'rails_helper'

describe MainHeaderImage do
  it "has a valid factory" do
    expect(build(:main_header_image)).to be_valid
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:position) }
    it { is_expected.to validate_presence_of(:image) }
    it { is_expected.to validate_numericality_of(:position).greater_than(0) }
  end

  describe "without a position" do
    let(:object) { build(:main_header_image, position: nil) }
    it_behaves_like "validating presence", :position
  end

  describe "without a image" do
    let(:object) { build(:main_header_image, image: nil) }
    it_behaves_like "validating presence", :image
  end

  describe "with position lower than 1" do
    let(:object) { build(:main_header_image, position: 0) }
    it_behaves_like "validating number greater than a count", :position, 0
  end

  describe "with a not numbered position" do
    let(:object) { build(:main_header_image, position: 'a') }
    it_behaves_like "validating that is a number", :position
  end
end