class User < ApplicationRecord
  belongs_to :city
  has_many :gossips
  has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
  has_many :likes
  has_many :comments
  validates :email,
    presence: true,
    uniqueness: true
  has_secure_password
  validates :password,
    presence: true,
    length: { minimum: 6 }
end
