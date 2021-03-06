require 'rubygems'
require 'rspec'
require './lib/fias_parser'
require 'fias_parser'
require File.realpath('spec/models') + '/base_obj.rb'
Dir[File.realpath('spec/models') + '/*.rb'].each { |m| require m }


unless {}.respond_to?(:slice)
  class Hash
    def slice(*values)
      select { |k,v| values.include?(k) }
    end
  end
end

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  config.order = 'random'
end
