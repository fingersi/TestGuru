module User::Auth

  extend ActiveSupport::Concern

  attr_reader :password
  attr_writer :password_confirmation

  include do
    validates :email, presence: true
    validates :password, presence: true, if: Proc.new{ |u| u.password_digest.present? }
    validates :password, confirmation: true
    validates :login, presence: true
  end

  def authenticate(password_string)
    digest(password_string) == self.password_digest ? self : false
  end

  def password=(password_string)
    if password_string.nil?
      self.password_digest = nil
    elsif password_string.present?
      @password = password_string
      self.password_digest = digest(password_string)
    end
  end

  private

  def digest(password_string)
    Digest::SHA1.hexdigest(password_string)
  end
end