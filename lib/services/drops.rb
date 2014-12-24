module Drops
  def self.create(url)
    drop = Drop.new url
    drop.save
    drop
  end
end
