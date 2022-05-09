class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :trackable, :lockable,
         authentication_keys: [:login]    

  validates :mobile, presence: true, uniqueness: true 
  VALID_USERNAME_REGEX = /\A[a-zA-Z]+\z/
  validates :username, presence: true, length: { maximum: 10 }, format: { with: VALID_USERNAME_REGEX, message: "only allows letters" }, uniqueness: { case_sensitive: false }

  attr_accessor :login

  def login
    @login || self.username || self.email || self.mobile
  end  

  private

  def self.find_for_database_authentication(warden_condition)
    conditions = warden_condition.dup
    if(login = conditions.delete(:login))
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value",
      { value: login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email) || conditions.has_key?(:mobile)
      where(conditions.to_h).first
    end
  end

end   
