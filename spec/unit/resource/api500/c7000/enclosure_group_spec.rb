require 'spec_helper'

klass = OneviewSDK::API500::C7000::EnclosureGroup
RSpec.describe klass do
  include_context 'shared context'

  it 'inherits from API300' do
    expect(described_class).to be < OneviewSDK::API300::C7000::EnclosureGroup
  end

  describe '#initialize' do
    it 'sets the defaults correctly' do
      item = klass.new(@client_500)
      expect(item[:type]).to eq('EnclosureGroupV400')
      expect(item[:stackingMode]).to eq('Enclosure')
      expect(item[:enclosureCount]).to eq(1)
      expect(item[:interconnectBayMappingCount]).to eq(8)
    end
  end

  describe '#update' do
    it 'updating an enclosure group' do
      item = klass.new(@client_500, name: 'Name', uri: '/rest/fake', 'eTag' => 'anyTag')
      options = { 'name' => 'Name_Updated', 'uri' => '/rest/fake', 'eTag' => 'anyTag' }
      resp = FakeResponse.new(options)
      expect(@client_500).to receive(:rest_put).with(item['uri'], { 'body' => item.data }, item.api_version).and_return(resp)
      allow(klass).to receive(:find_by).and_return([klass.new(@client_500, options.merge('eTag' => 'anotherTag'))])
      item = item.update(name: 'Name_Updated')
      expect(item['name']).to eq(options['name'])
      expect(item['uri']).to eq(options['uri'])
      expect(item['eTag']).to eq('anotherTag')
    end
  end
end
