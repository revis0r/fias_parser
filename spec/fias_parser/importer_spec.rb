require "spec_helper"

describe FiasParser::Importer do
  it "should raise an BadSettings" do
    expect do
      importer = FiasParser::Importer.new do |settings|
        settings.addr_object FiasParser::AddrObj, :aoguid => :ao_guid
      end
    end.to raise_error FiasParser::BadSettings
  end

  it "should be an FiasParser::Importer" do
    importer = FiasParser::Importer.new do |settings|
      settings.addr_object FiasParser::AddrObj, :aoguid => :ao_guid
      settings.house FiasParser::House, :aoguid => :ao_guid
      settings.base 'spec/base/'
    end
    importer.should be_an_instance_of FiasParser::Importer
  end

  it "Count of objects in test base should be equal 14" do
    importer = FiasParser::Importer.new do |settings|
      settings.addr_object FiasParser::AddrObj, :aoguid => :ao_guid
      settings.house FiasParser::House, :aoguid => :ao_guid
      settings.base 'spec/base/'
      settings.set_batch_size 10
    end
    size = 0
    importer.import_addrobj do |batch|
      size += batch.size
    end
    size.should be_equal 10
  end

  it "Count of houses in testbase should be greaten than zero" do
    importer = FiasParser::Importer.new do |settings|
      settings.addr_object FiasParser::AddrObj, :aoguid => :ao_guid
      settings.house FiasParser::House, :aoguid => :ao_guid
      settings.base 'spec/base/'
    end
    size = 0
    importer.import_house do |batch|
      size += batch.size
    end
    size.should be_equal 24
  end
end