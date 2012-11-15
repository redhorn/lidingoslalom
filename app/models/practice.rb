class Practice < ActiveRecord::Base
  attr_accessible :date, :location, :notes, :group_id
  belongs_to :group
end
