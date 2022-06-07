class SetDefaultValueForStatusMission < ActiveRecord::Migration[6.1]
  def change
    change_column :missions, :status, :boolean, default: false
  end
end
