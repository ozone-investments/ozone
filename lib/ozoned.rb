# frozen_string_literal: true

require 'optparse'
require 'awesome_print'
require 'yaml'
require_relative 'ozoned/blockchain.rb'

options = if File.exist? 'config.yml'
            YAML.load_file('config.yml')
          else
            {}
          end

if ARGV.any?
  OptionParser.new do |op|
    op.on('-h', '--help', 'This help message') do |_help|
      puts op
      exit
    end
    op.on('-v', '--version', 'Print version and exit') do |_version|
      options['network'] = 'testnet'
      exit
    end
    op.parse!
  end
end

ap options

puts BlockChain.new(options)
