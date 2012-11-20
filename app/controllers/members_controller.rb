class MembersController < ApplicationController

  def index
    if params[:group_id].nil?
      @members = Member.all.order("name ASC")
    else
      @group = Group.find(params[:group_id])
      @members = Member.where(group_id: @group.id).order("name ASC")
    end

    respond_to do |format|
      format.html
      format.json { render json: @members }
    end
  end

  # GET /members/1
  # GET /members/1.json
  def show
    @group = Group.find(params[:group_id])
    @member = Member.find(params[:id])
    @num_practices = @member.attendances.where(attended: true).size
    @num_missed_practices = @member.attendances.where(attended: false).size
    unless @member.practices.empty?
      @latest_attendance = @member.practices.order("date DESC").first.date
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @member }
    end
  end

  # GET /members/new
  # GET /members/new.json
  def new
    @group = Group.find(params[:group_id])
    @member = Member.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @member }
    end
  end

  # GET /members/1/edit
  def edit
    @group = Group.find(params[:group_id])
    @member = Member.find(params[:id])
  end

  # POST /members
  # POST /members.json
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

  # PUT /members/1
  # PUT /members/1.json
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

  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    @member = Member.find(params[:id])
    @member.destroy

    respond_to do |format|
      format.html { redirect_to members_url }
      format.json { head :no_content }
    end
  end
end
