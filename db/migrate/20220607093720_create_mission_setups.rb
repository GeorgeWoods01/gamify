class CreateMissionSetups < ActiveRecord::Migration[6.1]
  def change
    create_table :mission_setups do |t|
      t.boolean :completion
      t.references :student, null: false, foreign_key: true
      t.references :mission, null: false, foreign_key: true

      t.timestamps
    end
  end
end
