class User < ActiveRecord::Base

  devise :database_authenticatable, :recoverable, :rememberable,
  attr_accessible :email, :encrypted_password

  devise :database_authenticatable, :recoverable, :rememberable

	before_save { self.email = email.downcase }

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, 						 presence: true, 
  															   format: { with: VALID_EMAIL_REGEX },
														   uniqueness: { case_sensitive: false }
	validates :encrypted_password, presence: true, 
																 	 length: { minimum: 5 }

 	has_many :tickets, through: :event

end