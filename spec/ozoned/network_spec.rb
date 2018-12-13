# frozen_string_literal: true

require_relative '../../lib/ozoned/network'

RSpec.describe Network do
  describe '.add_peer' do
    it 'adds my IP to the peers list'
  end

  describe '.my_ip' do
    it 'returns my IP address' do
      external_ip = Net::HTTP.get(URI('https://api.ipify.org'))
      expect(described_class.my_ip).to eq(external_ip)
    end
  end
end
