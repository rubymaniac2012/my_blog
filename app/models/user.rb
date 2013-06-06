class User < ActiveRecord::Base

  attr_accessible :email, :name, :password, :password_confirmation
  has_secure_password

  before_save { |user| user.email=email.downcase }

  validates_presence_of :name, :email, :password, :password_confirmation

  validates_confirmation_of :password

  validates :name, length: {:minimum=>3}

  VALID_EMAIL_REGEX=/\A[\w\.]+@[a-z\d]{3,}+\.[a-z]{2,}+\z/i

  #VALID_PASSWORD_REGEX=/\A[A-Z\w]{3,}+\z/i

  #validates :password, format: { with: VALID_PASSWORD_REGEX, message: "is invalid. Initial letter should be capital" }

  validates :email, format: { with: VALID_EMAIL_REGEX, message: "is invalid" }, uniqueness: {case_sensitive: false}


end
