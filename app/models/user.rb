class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: :true, uniqueness: { case_sensitive: false }
  validates :email, uniqueness: true
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true
  has_one_attached :profile_photo
  has_many_attached :paintings

  attr_writer :login

  def login
    @login || self.username || self.email
  end


  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["username = :value OR lower(email) = :value", { :value => login }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end

end
