# encoding: utf-8

require "fias_parser/version"
require 'nokogiri'

module FiasParser
  class BadSettings < ArgumentError; end

  class Importer
    def initialize
      @settings = Settings.new
      yield @settings
      raise BadSettings, "Invalid settings" unless @settings.valid?
    end

    def import_addrobj(&block)
      file = Dir["#{@settings.base_path}/*"].grep(/as_addrobj_/i).first
      if File.exists?(file)
        parser = Nokogiri::XML::SAX::Parser.new FiasDocument.new('Object', @settings.addr_object_class, @settings, block)
        parser.parse(File.open(file))
        true
      else
        raise BadSettings, "File #{file} not found!"
      end
    end

    def import_house(&block)
      file = Dir["#{@settings.base_path}/*"].grep(/as_house_/i).first
      if File.exists?(file)
        parser = Nokogiri::XML::SAX::Parser.new FiasDocument.new('House', @settings.house_class, @settings, block)
        parser.parse(File.open(file))
        true
      else
        raise BadSettings, "File #{file} not found!"
      end
    end
  end

  class Settings
    attr_reader :addr_object_class, :house_class, :mappings, :base_path, :batch_size

    def initialize
      @addr_object_class = nil
      @house_class = nil
      @base_path = nil
      @mappings = {}
      @batch_size = 2000
    end

    def addr_object(ao_class, mappings={})
      @addr_object_class = ao_class
      @mappings[ao_class] = mappings
    end

    def house(house_class, mappings={})
      @house_class = house_class
      @mappings[house_class] = mappings
    end

    def base(path)
      if File.exists?(path)
        @base_path = File.realpath(path)
      end
    end

    def set_batch_size(size)
      @batch_size = size
    end

    def valid?
      !@addr_object_class.nil? && !@house_class.nil? && !@base_path.nil?
    end
  end

  class FiasDocument < Nokogiri::XML::SAX::Document
    def initialize(tag_name, klass, settings, block)
      @tag_name = tag_name
      @settings = settings
      @klass = klass
      @block = block
      @batch = []
    end

    def start_element(elem, attribs = [])
      attry = {}
      return if elem.to_s != @tag_name
      attribs.each do |attrib|
        attr_name = attrib[0].downcase
        if !@settings.mappings[@klass].nil? && !@settings.mappings[@klass][attr_name.to_sym].nil?
          attr_name = @settings.mappings[@klass][attr_name.to_sym]
        end
        attry["#{attr_name}"] = "#{attrib[1]}"
      end
      return if !attry['currstatus'].nil? && attry['currstatus'].to_s != '0'
      @batch.push attry.slice(*@klass.attribute_names)
      if @batch.size >= @settings.batch_size
        @block.call @batch
        @batch = []
      end
    end

    def end_document
      @block.call(@batch) unless @batch.empty?
    end
  end
end
