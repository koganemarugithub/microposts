class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  
  # パスは6文字以上20文字以内
  validates :password , length: { minimum: 6 , maximum: 20}
  # お住まいは50文字以内
  validates :location , numericality: { maximum:100 } 
  # 内容は必須入力かつ２文字以上300文字以下
  validates :profile , length: { maximum:300 }
end