require 'spec_helper'

klass = OneviewSDK::API600::Synergy::FCoENetwork
RSpec.describe klass, integration: true, type: DELETE, sequence: rseq(klass) do
  include_examples 'FCoENetworkDeleteExample', 'integration api600 context' do
    let(:current_client) { $client_600_synergy }
  end
end
