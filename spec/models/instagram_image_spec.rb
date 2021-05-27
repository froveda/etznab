require'rails_helper'

describe InstagramImage do
  subject(:instagram_image) { build(:instagram_image) }

  it { is_expected.to be_valid }

  describe "validations" do
    it { is_expected.to validate_presence_of(:instagram_id) }
    it { is_expected.to validate_presence_of(:code) }
    it { is_expected.to validate_presence_of(:thumbnail_src) }
    it { is_expected.to validate_uniqueness_of(:instagram_id).scoped_to(:code) }
    it { is_expected.to validate_numericality_of(:instagram_id) }

    context "when checking thumbnail_src format" do
      it { is_expected.to allow_values('https://foo.com', 'http://bar.com').for(:thumbnail_src) }
      it { is_expected.to_not allow_values('https:/foo.com', 'http:/bar.com', 'httpbar.com').for(:thumbnail_src) }
    end
  end

  describe "is invalid without an instagram_id" do
    let(:object) { build(:instagram_image, instagram_id: nil) }
    it_behaves_like "validating presence", :instagram_id
  end

  describe "is invalid without a code" do
    let(:object) { build(:instagram_image, code: nil) }
    it_behaves_like "validating presence", :code
  end

  describe "is invalid without a thumbnail_src" do
    let(:object) { build(:instagram_image, thumbnail_src: nil) }
    it_behaves_like "validating presence", :thumbnail_src
  end

  it "is invalid with a repeated combination of instagram_id and code" do
    instagram_id = Faker::Number.number(6)
    create(:instagram_image, instagram_id: instagram_id, code: 'instagramcode')
    invalid_instagram_image = build(:instagram_image, instagram_id: instagram_id, code: 'instagramcode')
    expect(invalid_instagram_image).to_not be_valid
    expect(invalid_instagram_image.errors[:instagram_id]).to include("ya está en uso")
  end

  describe "with a not numbered instagram id" do
    let(:object) { build(:instagram_image, instagram_id: 'a') }
    it_behaves_like "validating that is a number", :instagram_id
  end

  it "is invalid with a wrong formatted thumbnail_src url" do
    instagram_image = build(:instagram_image, thumbnail_src: 'a')
    expect(instagram_image).to_not be_valid
    expect(instagram_image.errors[:thumbnail_src]).to include("debe ser una URL válida")
  end

  it "must only get enabled images with show_enabled scope" do
    instagram_image_shown = create(:instagram_image, show: true)
    instagram_image_hidden = create(:instagram_image, show: false)

    shown_instagram_images = InstagramImage.show_enabled.all

    expect(shown_instagram_images).to include(instagram_image_shown)
    expect(shown_instagram_images).not_to include(instagram_image_hidden)
  end
end
