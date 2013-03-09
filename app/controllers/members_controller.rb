class MembersController < ApplicationController
  before_filter :signed_in_user

  def index
    if params[:group_id].nil?
      @members = Member.all.order("name ASC")
    else
      @group = Group.find(params[:group_id])
      @members = Member.where(group_id: @group.id).order("is_trainer DESC, name ASC")
    end

    respond_to do |format|
      format.html
      format.json { render json: @members }
    end
  end

  def show
    @group = Group.find(params[:group_id])
    @member = Member.find(params[:id])
    @num_practices = @member.attendances.where(attended: true).size
    @num_missed_practices = @member.attendances.where(attended: false).size
    unless @member.practices.empty? or @num_practices == 0
      @latest_attendance = @member.practices.order("date DESC").first.date
    end

    respond_to do |format|
      format.html
      format.json { render json: @member }
    end
  end

  def new
    @group = Group.find(params[:group_id])
    @member = Member.new

    respond_to do |format|
      format.html
      format.json { render json: @member }
    end
  end

  def edit
    @group = Group.find(params[:group_id])
    @member = Member.find(params[:id])
  end

  def create
    @group = Group.find(params[:group_id])
    @member = Member.new(params[:member])
    @member.group_id = @group.id

    respond_to do |format|
      if @member.save
        format.html { redirect_to group_members_path, notice: 'Member was successfully created.' }
        format.json { render json: @member, status: :created, location: @member }
      else
        format.html { render action: "new" }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @member = Member.find(params[:id])

    respond_to do |format|
      if @member.update_attributes(params[:member])
        format.html { redirect_to group_members_path, notice: 'Member was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @member = Member.find(params[:id])
    @member.attendances.each do |a|
      a.destroy
    end
    @member.destroy

    respond_to do |format|
      format.html { redirect_to group_members_path }
      format.json { head :no_content }
    end
  end
end
