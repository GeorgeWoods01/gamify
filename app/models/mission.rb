class Mission < ApplicationRecord
  has_many :students, through: :mission_setups
  belongs_to :classroom

  validates :name, presence: true
  validates :coins, presence: true
  validates :status, presence: true
  validates :description, length: { minimum: 10 }
  validates :time_length, presence: true
end
