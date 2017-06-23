class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  has_many :received_messages, class_name: 'Message', foreign_key: 'recipent_id'
  has_many :sent_messages, class_name: 'Message', foreign_key: 'sender_id'

  def to_s
    display_name
  end
end
