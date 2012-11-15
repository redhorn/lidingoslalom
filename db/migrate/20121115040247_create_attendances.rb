class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.integer :member_id
      t.integer :practice_id

      t.timestamps
    end
  end
end
