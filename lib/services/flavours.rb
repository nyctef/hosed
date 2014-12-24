class Flavours
  @flavours = []

  def self.reset
    @flavours = []
  end

  def self.start(drop)
    @flavours.each { |f| 
      attrs = f.call(drop.url)
      attrs.each { |k,v|
        drop.set(k => v)
      }
    }
  end

  def self.add(callable=nil, &block)
    if not callable.present? ^ block.present?
      raise "exactly one callable or block is required"
    end
    @flavours << (callable || block)
  end
end
