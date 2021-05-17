class Blog < ApplicationRecord
  validates :title, presence: true
  validates :content, length: {in: 1..140}
  belongs_to :user
  def user
    return User.find_by(id: self.user_id)
  end
end
