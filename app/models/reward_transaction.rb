class RewardTransaction < ApplicationRecord
  belongs_to :reward
  belongs_to :student
end
