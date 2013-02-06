class AddIndicesToAttendance < ActiveRecord::Migration
  def change
    add_index :attendances, :practice_id
    add_index :attendances, :member_id
  end
end
