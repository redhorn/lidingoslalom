class PracticesController < ApplicationController
  before_filter :signed_in_user

  def index
    @group = Group.find(params[:group_id])
    @practices = Practice.where(group_id: @group.id).order("date DESC")

    respond_to do |format|
      format.html
      format.json { render json: @practices }
    end
  end

  def regindex
    @group = Group.find(params[:group_id])
    @practices = Practice.where(group_id: @group.id).order("date DESC")

    respond_to do |format|
      format.html
      format.json { render json: @practices }
    end
  end

  def register
    @group = Group.find(params[:group_id])
    @practice = Practice.find(params[:practice_id])
    @sort = params[:sort] || "az"
    if @sort == "az"
      sort_order = "name ASC"
    elsif @sort == "birthyear"
      sort_order = "extract('year' from birthyear) ASC, name ASC"
    elsif @sort == "group"
      sort_order = "group_name ASC, name ASC"
    end
    @members = Member.where(group_id: @group.id).order("is_trainer DESC", sort_order)
    @attendance = Attendance.new
  end

  def show
    @practice = Practice.find(params[:id])

    respond_to do | format |
      format.html
      format.json { render json: @practice }
    end
  end

  def new
    @group = Group.find(params[:group_id])
    @practice = Practice.new

    respond_to do |format|
      format.html
      format.json { render json: @practice }
    end
  end

  def edit
    @group = Group.find(params[:group_id])
    @practice = Practice.find(params[:id])
  end

  def create
    @group = Group.find(params[:group_id])
    @practice = Practice.new(params[:practice])
    @practice.group_id = @group.id

    respond_to do |format|
      if @practice.save
        format.html { redirect_to "/groups/#{@group.id}/actions", notice: 'Practice was successfully created.' }
        format.json { render json: @practice, status: :created, location: @practice }
      else
        format.html { render action: "new" }
        format.json { render json: @practice.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @practice = Practice.find(params[:id])

    respond_to do |format|
      if @practice.update_attributes(params[:practice])
        format.html { redirect_to group_practices_path, notice: 'Practice was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @practice.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @practice = Practice.find(params[:id])
    @practice.destroy

    respond_to do |format|
      format.html { redirect_to practices_url }
      format.json { head :no_content }
    end
  end

  def actions
    @practice = Practice.find(params[:id])
  end
end
