class Group < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :entities, dependent: :destroy

  validates :name, presence: true, length: { maximum: 255 }

  def total_amount
    entities.sum('amount')
  end
end
