class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  has_many :received_messages, class_name: 'Message', foreign_key: 'recipent_id'
  has_many :sent_messages, class_name: 'Message', foreign_key: 'sender_id'

  has_many :friendships
  has_many :friends, through: :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user

  # 0: friend request was sent
  # 1: someone sent to me friend request
  # 2: friend
  # 3: unfriend

  def friend_status_with(friend_id)
    friendship = friendships.where(friend_id: friend_id).first
    if friendship.nil?
      friend = User.find_by_id(friend_id)
      friendship = friend.friendships.where(friend_id: id).first
      if friendship.nil?
        -1
      else
        friendship.status.blank? ? 1 : friendship.status
      end
    else
      friendship.status.blank? ? 0 : friendship.status
    end
  end

  def to_s
    display_name
  end
end
