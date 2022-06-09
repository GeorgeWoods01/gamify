class AddLengthToMissions < ActiveRecord::Migration[6.1]
  def change
    add_column :missions, :length, :string
  end
end
