class User < ApplicationRecord

  has_secure_password

  validates :password_confirmation, presence: true
  validates :password, length: { minimum: 4 }
  validates :email, presence: true, uniqueness: { :case_sensitive => false }
  validates :first_name, presence: true
  validates :last_name, presence: true

  def self.authenticate_with_credentials(email, password)
    @user = self.find_by("LOWER(email) = LOWER(?)", email.strip)
    if @user && @user.authenticate(password)
      return @user
    else
      return nil
    end
  end

end
