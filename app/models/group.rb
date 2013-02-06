class Group < ActiveRecord::Base
  attr_accessible :name, :sort_order
  has_many :members
  has_many :practices

  def to_csv
  	cols = "#{name}\n"
  	practices.all(order: "date").each do |p|
  		cols = "#{cols},#{p.date}"
  	end

  	rows = "\n"
  	members.all(order: "name ASC").each do |m|
  		rows = "#{rows}#{m.name}"
  		practices.all(order: "date").each do |p|
  			a = m.attendances.where(practice_id: p.id)
				if a.empty?
					attended = ""
				else
					attended = a.first.attended ? "1" : ""
				end

  			rows = "#{rows},#{attended}"
  		end
  		rows = "#{rows}\n"
  	end
  	"#{cols}#{rows}"

  end
end
