class Entity < ApplicationRecord
    belongs_to :user, class_name: 'User', foreign_key: 'user_id'
    has_and_belongs_to_many :groups, dependent: :destroy
  
    validates :name, :amount, presence: true, length: { maximum: 255 }
    validates :amount, numericality: { greater_than: 0 }
end
