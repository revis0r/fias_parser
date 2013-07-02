class Fias::BaseObj

  def initialize(attrs)
    @attrs = attrs
    if (attrs.keys - self.class.attribute_names).length > 0
      raise "Unknown keys"
    end
  end

  def save
    self.class.count ||= 0
    self.class.count += 1
  end

  class << self
    @count = 0

    def count
      @count
    end

    def count=(cnt)
      @count = cnt
    end

    def attribute_names
      []
    end
  end
end