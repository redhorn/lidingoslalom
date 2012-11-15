class AddAttendedToAttendance < ActiveRecord::Migration
  def change
    add_column :attendances, :attended, :boolean
  end
end
