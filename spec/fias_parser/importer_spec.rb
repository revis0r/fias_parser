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

  it "should be equal 15" do
    importer = FiasParser::Importer.new do |settings|
      settings.addr_object FiasParser::AddrObj, :aoguid => :ao_guid
      settings.house FiasParser::House, :aoguid => :ao_guid
      settings.base 'spec/base/'
    end
    importer.import_addrobj
    # puts "Imported: #{FiasParser::AddrObj.count}"
    FiasParser::AddrObj.count.to_i.should be_equal 15
  end

  it "should be greaten than zero" do
    importer = FiasParser::Importer.new do |settings|
      settings.addr_object FiasParser::AddrObj, :aoguid => :ao_guid
      settings.house FiasParser::House, :aoguid => :ao_guid
      settings.base 'spec/base/'
    end
    importer.import_house
    # puts "Imported: #{FiasParser::House.count}"
    FiasParser::House.count.to_i.should be_equal 25
  end
end