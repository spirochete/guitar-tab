class Tab
  include MongoMapper::Document
  include Sunspot::Mongo

  key :author, String
  key :artist, String
  key :song, String
  key :tuning, String, :length => 6

  searchable do
    text :artist
  end
end
