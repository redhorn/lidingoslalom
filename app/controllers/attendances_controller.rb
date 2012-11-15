class AttendancesController < ApplicationController

	def create
		@group = Group.find(params[:group_id])
		@practice = Practice.find(params[:practice_id])
		@members = params[:members]

		@practice.attendances.each do |a|
			a.destroy
		end

		@members.each do |m|
			data = m[1].split(',')
			mid = data[0]
			mval = data[1] == 'y'

			a = Attendance.new(:member_id => mid, :practice_id => @practice.id, :attended => mval)
			a.save
		end
	end

end
