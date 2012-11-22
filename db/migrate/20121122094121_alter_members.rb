class AlterMembers < ActiveRecord::Migration
  def change
    rename_column :members, :dateofbirth, :birthyear
    rename_column :members, :parent_phone, :contact1_phone
    rename_column :members, :parent_email, :contact1_email
    rename_column :members, :parent2_phone, :contact2_phone
    rename_column :members, :parent2_email, :contact2_email
    remove_column :members, :parent_name
    remove_column :members, :parent2_name
    add_column :members, :group_name, :string
  end
end