require'rails_helper'

describe Service do
  it "has a valid factory" do
    expect(FactoryGirl.build(:service)).to be_valid
  end

  it "is invalid without a name" do
    service = FactoryGirl.build(:service, name: nil)
    expect(service).to_not be_valid
    expect(service.errors[:name]).to include("no puede estar en blanco")
  end

  it "is invalid without a position" do
    service = FactoryGirl.build(:service, position: nil)
    expect(service).to_not be_valid
    expect(service.errors[:position]).to include("no puede estar en blanco")
  end

  it "is invalid with a position lower than 1" do
    service = FactoryGirl.build(:service, position: 0)
    expect(service).to_not be_valid
    expect(service.errors[:position]).to include("debe ser mayor que 0")
  end

  it "is invalid with a not number position" do
    service = FactoryGirl.build(:service, position: 'a')
    expect(service).to_not be_valid
    expect(service.errors[:position]).to include("no es un número")
  end

  it "is invalid without an image" do
    service = FactoryGirl.build(:service, image: nil)
    expect(service).to_not be_valid
    expect(service.errors[:image]).to include("no puede estar en blanco")
  end
end