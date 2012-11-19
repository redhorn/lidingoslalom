class AddTimeToPractices < ActiveRecord::Migration
  def change
    add_column :practices, :starts_at, :date
    add_column :practices, :ends_at, :date
  end
end
