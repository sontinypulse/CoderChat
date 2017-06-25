class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, :class_name => 'User'
  scope :status, ->(status) { where(:status => status) }
  scope :accepted, -> { status(2) }
  scope :pending, -> { status(1) }
end
