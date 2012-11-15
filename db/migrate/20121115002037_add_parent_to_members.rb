class AddParentToMembers < ActiveRecord::Migration
  def change
    add_column :members, :parent_name, :string
    add_column :members, :parent_phone, :string
    add_column :members, :parent_email, :string
  end
end
