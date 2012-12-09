class Tab
  include MongoMapper::Document

  key :author, String
  key :artist, String
  key :song, String
  key :tuning, String

end
