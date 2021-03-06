# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(255)
#  password_digest :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base

  has_secure_password

  has_many :softwares

  validates :email,
  presence: true,
  uniqueness: true,
  confirmation: true

  validates :password,
  presence: true,
  confirmation: true

end
