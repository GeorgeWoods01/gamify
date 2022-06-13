class DropReward < ActiveRecord::Migration[6.1]
  def change
    drop_table :reward_transactions
  end
end
