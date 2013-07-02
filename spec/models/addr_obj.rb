class FiasParser::AddrObj < FiasParser::BaseObj
  attr_reader :ao_guid, :parent_guid, :ao_level, :off_name, :short_name, :region_code, :area_code, :auto_code, :city_code, :ctar_code, :street_code, :postalcode

  class << self
    def attribute_names
      [:ao_guid, :parent_guid, :ao_level, :off_name, :short_name, :region_code, :area_code, :auto_code, :city_code, :ctar_code, :street_code, :postalcode].map(&:to_s)
    end
  end
end