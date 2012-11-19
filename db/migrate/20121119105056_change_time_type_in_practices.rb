class ChangeTimeTypeInPractices < ActiveRecord::Migration
  def self.up
  	change_table :practices do |t|
	    t.change :starts_at, :datetime
  	  t.change :ends_at, :datetime
  	end
  end

  def self.down
  	change_table :practices do |t|
	    t.change :starts_at, :date
  	  t.change :ends_at, :date
  	end
  end
end
