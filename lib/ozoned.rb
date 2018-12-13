require 'optparse'
require 'awesome_print'
require 'yaml'
require_relative 'ozoned/blockchain.rb'

if File.exists? ("config.yml")
  options = YAML.load_file("config.yml")
else
  options = {}
end

if ARGV.any?
  OptionParser.new do |op|
    op.on('-h', '--help', 'This help message') do |help|
      puts op
      exit
    end
    op.on('-v', '--version', 'Print version and exit') do |version|
      options['network'] = 'testnet'
      exit
    end
    op.parse!
  end
end

ap options

puts BlockChain.new(options)
