# == Schema Information
#
# Table name: users
#
#  id              :uuid             not null, primary key
#  name            :string
#  email           :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  role            :integer          default("normal")
#
class User < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3, maximum: 25 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    length: { maximum: 105 },
                    format: { with: VALID_EMAIL_REGEX }
  has_secure_password

  enum role: {
    primary_admin: 0,
    admin: 1,
    normal: 2
  }

  has_many :access_grants,
            class_name: 'Doorkeeper::AccessGrant',
            foreign_key: :resource_owner_id,
            dependent: :destroy

  has_many :access_tokens,
            class_name: 'Doorkeeper::AccessToken',
            foreign_key: :resource_owner_id,
            dependent: :destroy

  # constant
  ROLES = [["Admin", "admin"], ["Normal", "normal"]]
end
