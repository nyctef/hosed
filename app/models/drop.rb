require "mongo_mapper"

class Drop
  include MongoMapper::Document

  key :url, String

  validates :url, presence: true
end

Drop.ensure_index [[:url, 1]], :unique => true
