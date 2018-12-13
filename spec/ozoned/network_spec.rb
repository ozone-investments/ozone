# frozen_string_literal: true

require_relative '../../lib/ozoned/network'

RSpec.describe Network do
  describe '.my_ip' do
    it 'returns my IP address' do
      expect(described_class.my_ip).to eq(Net::HTTP.get(URI('https://api.ipify.org')))
    end
  end
end
