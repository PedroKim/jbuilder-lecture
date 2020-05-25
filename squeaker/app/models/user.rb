# == Schema Information
#
# Table name: users
#
#  id          :bigint           not null, primary key
#  username    :string           not null
#  location_id :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  birth_year  :integer          not null
#

class User < ApplicationRecord
  validates :username, :session_token, presence: true, uniqueness: true
  #validates is standard validations for presence, uniqueness, inclusion
  # and will be most of use-cases 
  # without 's' at the end of validate is for custion validation

  validates :password_digest, presence: true 
  validates :password, length: { minimum: 6 }, allow_nil: true

  after_initialize :ensure_session_token
  attr_reader :password

  #syntactic sugar version>
  belongs_to :location, #name can be anything like 'banana' but be semantic
    foreign_key: :location_id,
    primary_key: :id,
    class_name: :Location

  #long-hand version>
  # belongs_to(:location, {
  #   foreign_key: :location_id,
  #   primary_key: :id,
  #   class_name: :Location
  # })
  # belongs_to: create a method named with the first argument
  # receives two arguments


  has_many :squeaks,
    foreign_key: :author_id,
    primary_key: :id, 
    class_name: :Squeak #Capitalized Model class name

  has_many :likes,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :Like

  has_many :liked_squeaks,
    through: :likes, 
    source: :squeak

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username) 
    return nil unless user && user.is_password?(password) 
    user
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def reset_session_token!
    self.update!(session_token: self.class.generate_session_token)
    self.session_token
  end

  def is_password?(password)
    bcrypt_password = BCrypt::Password.new(self.password_digest) 
    bcrypt_password.is_password?(password)
  end

  private

  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64
  end

end
