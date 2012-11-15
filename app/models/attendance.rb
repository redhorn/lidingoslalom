class Attendance < ActiveRecord::Base
  attr_accessible :member_id, :practice_id
  belongs_to :member
  belongs_to :practice
end
