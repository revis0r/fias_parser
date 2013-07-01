require 'rubygems'
require 'rspec'
require './lib/fias'
require 'fias'
require File.realpath('spec/models') + '/base_obj.rb'
Dir[File.realpath('spec/models') + '/*.rb'].each { |m| require m }

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  config.order = 'random'
end
