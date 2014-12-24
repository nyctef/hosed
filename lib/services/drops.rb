module Drops
  def self.create(url)
    drop = Drop.new url
    drop.save
    drop
  end

  def self.find(id)
    Drop.find(id)
  end
end
