class RemoveTimeLengthFromMissions < ActiveRecord::Migration[6.1]
  def change
    remove_column :missions, :time_length, :time
  end
end
