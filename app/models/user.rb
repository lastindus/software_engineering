class User < ActiveRecord::Base
    before_save{self.email = email.downcase}
    validates :name, presence: true, length: { maximum: 50}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    VALID_PHONE_REGEX = /\A\d{3}-\d{4}-\d{4}\z/
    validates :email, presence: true, length: { maximum: 255}, 
                        format: {with: VALID_EMAIL_REGEX},
                        uniqueness: {case_sensitive: false}
    validates :phonenumber, presence: true#, format: {with: VALID_PHONE_REGEX}
    
    has_secure_password
    validates :password, presence: true, length: { minimum:6 }
    has_many :houses , dependent: :destroy
    has_many :comments, dependent: :destroy
end
