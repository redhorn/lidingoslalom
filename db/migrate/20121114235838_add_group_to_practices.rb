class AddGroupToPractices < ActiveRecord::Migration
  def change
    add_column :practices, :group_id, :integer
  end
end
