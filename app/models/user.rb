class User < ApplicationRecord
  before_save { email.downcase! }  # self.email = email.downcase
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, presence: true, length: {maximum: 50}
  validates :email, presence: true, length: {maximum: 255},
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: true  # case_sensitive: false，Rails 会自动指定 :uniqueness 的值为 true。
  validates :password, presence: true, length: { minimum: 6 }  # 密码最低6位
  has_secure_password    # 对应的模型中有个名为 password_digest 的属性

end
