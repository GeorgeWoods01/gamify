class AddClassroomIdToMission < ActiveRecord::Migration[6.1]
  def change
    add_reference :missions, :classroom, null: false, foreign_key: true
  end
end
