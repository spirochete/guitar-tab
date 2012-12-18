class Tab
  include MongoMapper::Document
  include Sunspot::Rails
  include Sunspot::Mongo

  belongs_to :user

  key :artist, String
  key :song, String
  key :tuning, String
  key :submission_file_name, String
  timestamps!

  attr_accessible :submission, :submission_cache, :artist, :song, :tuning, :created_at, :updated_at
  mount_uploader :submission, SubmissionUploader

  validates_presence_of :artist, :song, :tuning, :submission

  searchable do
    text :artist
    text :song
    text :tuning
    time :updated_at
    string :artist
    string :song
    string :tuning
    string :user_id
  end

end
