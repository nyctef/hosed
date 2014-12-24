module Drops
  def self.create(url)
    drop = Drop.new(url: url)
    drop.save
    drop
  end

  def self.find(id)
    Drop.find(id)
  end

  def self.all
    Drop.all.map do |drop|
      {url: drop.url,
       data: get_data_keys(drop).inject({}) { |h, key| h[key.to_sym] = drop[key] if drop[key]; h }}
    end
  end

  private
  def self.get_data_keys(drop)
    drop.keys.keys.reject { |x| x == "_id" || x == "url" }
  end


end
