# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  administrator   :boolean          default(FALSE)
#  name            :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_name  (name) UNIQUE
#
class User < ApplicationRecord
  has_secure_password

  validates :name,
    presence: true,
    uniqueness: true,
    length: { maximum: 16 }

  validates :password,
    length: { minimum: 8 }
end
