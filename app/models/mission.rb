class Mission < ApplicationRecord
  has_many :students, through: :mission_setups
  belongs_to :classroom
  has_one_attached :photo

  validates :name, presence: true
  validates :coins, presence: true
  validates :description, length: { minimum: 10 }
end
