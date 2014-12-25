require "mongo_mapper"

class Drop
  include MongoMapper::Document

  key :url, String

  validates :url, presence: true
end
