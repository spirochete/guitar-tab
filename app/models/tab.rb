class Tab
  include MongoMapper::Document
  include Sunspot::Mongo

  belongs_to :user

  key :artist, String
  key :song, String
  key :tuning, String, :length => 12

  searchable do
    string :artist
    string :song
    string :tuning
    text :artist
    text :song
    text :tuning
  end
end
