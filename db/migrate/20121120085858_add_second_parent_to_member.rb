class AddSecondParentToMember < ActiveRecord::Migration
  def change
    add_column :members, :parent2_name, :string
    add_column :members, :parent2_phone, :string
    add_column :members, :parent2_email, :string
  end
end
