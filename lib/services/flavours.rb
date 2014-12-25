require_relative "../../lib/services/drops"

module FlavourWorker
  def perform(id)
    drop = Drops.find(id)
    attrs = get_attrs(drop.url)
    attrs.each { |k,v|
      drop.set(k => v)
    }
  end
end

class Flavours
  @flavours = []

  def self.reset
    @flavours = []
  end

  def self.start(drop)
    @flavours.each { |f| 
      Resque.enqueue(f, drop.id)
    }
  end

  def self.add(flavour)
    @flavours << flavour
  end
end
