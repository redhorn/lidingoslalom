class Member < ActiveRecord::Base
  attr_accessible :name, :dateofbirth, :parent_name, :parent_phone, :parent_email, :group_id
  belongs_to :group
  has_many :attendances
  has_many :practices, :through => :attendances
end
