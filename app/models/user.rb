class User
  include MongoMapper::Document

  has_many :tabs
  
  key :email, String
  key :username, String
  key :first_name, String
  key :last_name, String
  key :encrypted_password, String
  key :password_salt, String
  key :reset_password_token, String
  key :remember_token, String
  key :remember_created_at, Time
  key :sign_in_count, Integer
  key :current_sign_in_at, Time
  key :current_sign_in_ip, String
  key :last_sign_in_at, Time
  key :last_sign_in_ip, String
  timestamps!
  
  attr_accessible :email, :username, :password, :password_confirmation, :remember_me
  attr_accessor :current_password

  validates_presence_of :username
  validates_uniqueness_of :username
  
  devise :database_authenticatable, :registerable, :validatable, :recoverable, :rememberable, :trackable


end