require "spec_helper"

describe Fias::Importer do
  it "should raise an BadSettings" do
    expect do
      importer = Fias::Importer.new do |settings|
        settings.addr_object Fias::AddrObj, :aoguid => :ao_guid
      end
    end.to raise_error Fias::BadSettings
  end

  it "should be an Fias::Importer" do
    importer = Fias::Importer.new do |settings|
      settings.addr_object Fias::AddrObj, :aoguid => :ao_guid
      settings.house Fias::House, :aoguid => :ao_guid
      settings.base 'spec/base/'
    end
    importer.should be_an_instance_of Fias::Importer
  end

  it "should be equal 15" do
    importer = Fias::Importer.new do |settings|
      settings.addr_object Fias::AddrObj, :aoguid => :ao_guid
      settings.house Fias::House, :aoguid => :ao_guid
      settings.base 'spec/base/'
    end
    importer.import_addrobj
    # puts "Imported: #{Fias::AddrObj.count}"
    Fias::AddrObj.count.to_i.should be_equal 15
  end

  it "should be greaten than zero" do
    importer = Fias::Importer.new do |settings|
      settings.addr_object Fias::AddrObj, :aoguid => :ao_guid
      settings.house Fias::House, :aoguid => :ao_guid
      settings.base 'spec/base/'
    end
    importer.import_house
    # puts "Imported: #{Fias::House.count}"
    Fias::House.count.to_i.should be_equal 25
  end
end