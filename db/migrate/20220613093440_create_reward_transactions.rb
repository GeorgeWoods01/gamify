class CreateRewardTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :reward_transactions do |t|
      t.references :reward, null: false, foreign_key: true
      t.references :student, null: false, foreign_key: true

      t.timestamps
    end
  end
end
