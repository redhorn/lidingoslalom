class AddDateOfBirthToMembers < ActiveRecord::Migration
  def change
    add_column :members, :dateofbirth, :date
  end
end
