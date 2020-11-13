class Task < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :name, presence: true, length: { maximum: 15 }
  validates :description, presence: true, length: { in: 5..50 }
end
