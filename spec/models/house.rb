class Fias::House < Fias::BaseObj
  attr_reader :houseid, :houseguid, :ao_guid, :housenum, :postalcode

  class << self
    def attribute_names
      [:houseid, :houseguid, :ao_guid, :housenum, :postalcode].map(&:to_s)
    end
  end
end