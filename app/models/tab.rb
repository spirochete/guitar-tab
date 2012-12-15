class Tab
  include MongoMapper::Document
  include Sunspot::Rails
  include Sunspot::Mongo

  belongs_to :user

  key :artist, String
  key :song, String
  key :tuning, String
  key :submission_file_name, String

  attr_accessible :submission, :submission_cache, :artist, :song, :tuning
  mount_uploader :submission, SubmissionUploader

  validates_presence_of :artist, :song, :tuning, :submission

  searchable do
    string :artist
    string :song
    string :tuning
    text :artist
    text :song
    text :tuning
    string :user_id
  end

end
