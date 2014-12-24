module Drops
  def Drops.create(url)
    drop = Drop.new url
    drop.save
    drop
  end
end
