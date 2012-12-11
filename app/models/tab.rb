class Tab
  include MongoMapper::Document
  include Sunspot::Rails
  include Sunspot::Mongo

  attr_accessible :submission, :submission_cache
  mount_uploader :submission, SubmissionUploader

  belongs_to :user

  key :artist, String
  key :song, String
  key :tuning, String
  key :submission_file_name, String

  searchable do
    string :artist
    string :song
    string :tuning
    text :artist
    text :song
    text :tuning
    string :user_id
    string :submission_file_name
  end
end
