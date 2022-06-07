class Classroom < ApplicationRecord
  belongs_to :user

  has_many :students
  has_many :missions
end
