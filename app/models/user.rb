# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string           not null
#  name            :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#
class User < ApplicationRecord
  has_secure_password
  before_validation { email.downcase! }

  validates :name, presence: true, length: { maximum: 20 }
  validates :email, presence: true, length: { maximum: 255 }, uniqueness: true,
            format: { with: /\A[\w.!#$%&'*+\/=?^`{|}~-]+@[\w-]+\.[\w-]+\z/i }
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
end
