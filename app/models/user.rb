class User < ActiveRecord::Base

  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :dob, presence: true
  validates :password, confirmation: true

  before_create :hash_password

  def password=(password)
    @password = password
  end

  def password
    return @password
  end

  def password_confirmation=(password_confirmation)
    @password_confirmation = password_confirmation
  end

  def password_confirmation
    return @password_confirmation
  end

  private

  def hash_password
    # RUN THE HASHING ALGO
    self.password_digest = self.password().upcase
  end
end