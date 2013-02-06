class Member < ActiveRecord::Base
  attr_accessible :name, :ref_number, :birthyear, :contact1_phone, :contact1_email, :contact2_phone, :contact2_email, :group_name, :group_id, :active
  belongs_to :group
  has_many :attendances
  has_many :practices, :through => :attendances
end
