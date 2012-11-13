class CreatePractices < ActiveRecord::Migration
  def change
    create_table :practices do |t|
      t.date :date
      t.string :location
      t.string :notes

      t.timestamps
    end
  end
end
