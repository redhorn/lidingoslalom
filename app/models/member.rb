class Member < ActiveRecord::Base
  attr_accessible :name, :ref_number, :dateofbirth, :parent_name, :parent_phone, :parent_email, :parent2_name, :parent2_phone, :parent2_email, :group_id
  belongs_to :group
  has_many :attendances
  has_many :practices, :through => :attendances
end
