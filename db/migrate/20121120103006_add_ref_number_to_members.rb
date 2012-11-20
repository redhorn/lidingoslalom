class AddRefNumberToMembers < ActiveRecord::Migration
  def change
    add_column :members, :ref_number, :string
  end
end
