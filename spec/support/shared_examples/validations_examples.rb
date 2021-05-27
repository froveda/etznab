# frozen_string_literal: true

## Presence
RSpec.shared_examples 'validating presence' do |attribute|
  let(:attribute) { attribute }

  it 'must be invalid' do
    expect(object).to_not be_valid
    expect(object.errors[attribute]).to include(I18n.t('errors.messages.blank'))
  end
end

## Number greater than 0
RSpec.shared_examples 'validating number greater than a count' do |attribute, count|
  let(:attribute) { attribute }
  let(:attribute) { count }

  it 'must be invalid' do
    expect(object).to_not be_valid
    expect(object.errors[attribute]).to include(I18n.t('errors.messages.greater_than', count: count))
  end
end

## Attribute is not a number
RSpec.shared_examples 'validating that is a number' do |attribute|
  let(:attribute) { attribute }

  it 'must be invalid' do
    expect(object).to_not be_valid
    expect(object.errors[attribute]).to include(I18n.t('errors.messages.not_a_number'))
  end
end

## Attribute must be included in a list
RSpec.shared_examples 'validating that it is included in the list of values' do |attribute|
  let(:attribute) { attribute }

  it 'must be invalid' do
    expect(object).to_not be_valid
    expect(object.errors[attribute]).to include(I18n.t('errors.messages.inclusion'))
  end
end

## Wrong format
RSpec.shared_examples 'validating format' do |attribute|
  let(:attribute) { attribute }

  it 'must be invalid' do
    expect(object).to_not be_valid
    expect(object.errors[attribute]).to include(I18n.t('errors.messages.invalid'))
  end
end
