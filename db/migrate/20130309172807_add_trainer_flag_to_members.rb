class AddTrainerFlagToMembers < ActiveRecord::Migration
  def change
  	add_column :members, :is_trainer, :boolean, :default => false
  end
end
