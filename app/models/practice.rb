class Practice < ActiveRecord::Base
  attr_accessible :date, :starts_at, :ends_at, :location, :notes, :group_id
  belongs_to :group
  has_many :attendances
  has_many :members, :through => :attendances
end
