class Fias::BaseObj

  def initialize(attrs)
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
  end
end