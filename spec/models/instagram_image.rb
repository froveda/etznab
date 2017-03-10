require'rails_helper'

describe InstagramImage do
  it "has a valid factory" do
    expect(build(:instagram_image)).to be_valid
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
    create(:instagram_image, instagram_id: 1447456397511020920, code: 'instagramcode')
    invalid_instagram_image = build(:instagram_image, instagram_id: 1447456397511020920, code: 'instagramcode')
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