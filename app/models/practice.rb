class Practice < ActiveRecord::Base
  attr_accessible :date, :location, :notes, :group_id
  belongs_to :group
  has_many :attendances
  has_many :members, :through => :attendances
end
