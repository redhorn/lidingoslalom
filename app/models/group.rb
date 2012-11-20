class Group < ActiveRecord::Base
  attr_accessible :name, :sort_order
  has_many :members
  has_many :practices
end
