class Message < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  belongs_to :recipent, class_name: 'User'
  default_scope { order("created_at DESC") }

end
