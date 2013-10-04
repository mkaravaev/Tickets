class User < ActiveRecord::Base

  devise :database_authenticatable, :recoverable, :rememberable, :registerable, :validatable

  #before_save { self.email = email.downcase }

 	has_many :tickets


end