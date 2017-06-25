class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  has_many :received_messages, class_name: 'Message', foreign_key: 'recipent_id'
  has_many :sent_messages, class_name: 'Message', foreign_key: 'sender_id'

  has_many :friendships
  has_many :friends, through: :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user

  has_many :accepted_friendships, ->{ where(status: 2) }, :class_name => "Friendship", :foreign_key => "user_id"
  has_many :accepted_friends, through: :accepted_friendships, :source => :friend

  has_many :inverse_accepted_friendships, ->{ where(status: 2) }, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_accepted_friends, through: :inverse_accepted_friendships, :source => :user

  has_many :sent_friendships, ->{ where(status: nil) }, :class_name => "Friendship", :foreign_key => "user_id"
  has_many :sent_friends, through: :sent_friendships, :source => :friend

  has_many :requested_friendships, ->{ where(status: nil) }, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :requested_friends, through: :requested_friendships, :source => :user

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

  def my_friends
    accepted_friends + inverse_accepted_friends
  end

  def full_name
    "#{display_name} (#{first_name} #{last_name})"
  end

  def to_s
    display_name
  end
end
