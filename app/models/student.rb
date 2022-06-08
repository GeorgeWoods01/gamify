class Student < ApplicationRecord
  belongs_to :classroom
  has_one_attached :photo

  has_many :missions, through: :mission_setups

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :date_of_birth, presence: true
end
