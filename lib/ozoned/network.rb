# frozen_string_literal: true

require 'net/http'

# All networking
class Network
  attr_reader :peers

  def initialize
    @peers = []
  end

  def self.gossip_with_peer; end

  def self.find_peers; end

  def self.add_peer; end

  def self.my_ip
    Net::HTTP.get(URI('https://api.ipify.org'))
  end
end
