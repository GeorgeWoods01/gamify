class CreateMissions < ActiveRecord::Migration[6.1]
  def change
    create_table :missions do |t|
      t.string :name
      t.integer :coins
      t.boolean :status
      t.text :description
      t.time :time_length

      t.timestamps
    end
  end
end
