require 'spec_helper'

klass = OneviewSDK::API500::C7000::InternalLinkSet
RSpec.describe klass, integration: true, type: CREATE, sequence: seq(klass) do
  include_examples 'InternalLinkSetCreateExample', 'integration api500 context' do
    let(:current_client) { $client_500 }
  end
end
