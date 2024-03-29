class GroupsController < ApplicationController
  before_filter :signed_in_user

  def index
    @groups = Group.order("sort_order ASC")
    @messages = Message.order("updated_at DESC")

    respond_to do |format|
      format.html
      format.json { render json: @groups }
    end
  end

  def show
    @group = Group.find(params[:id])

    respond_to do | format |
      format.html
      format.json { render json: @group }
    end
  end

  def new
    @group = Group.new

    respond_to do |format|
      format.html
      format.json { render json: @group }
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def create
    @group = Group.new(params[:group])

    respond_to do |format|
      if @group.save
        format.html { redirect_to groups_path, notice: 'Group was successfully created.' }
        format.json { render json: @group, status: :created, location: @group }
      else
        format.html { render action: "new" }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @group = Group.find(params[:id])

    respond_to do |format|
      if @group.update_attributes(params[:group])
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy

    respond_to do |format|
      format.html { redirect_to groups_url }
      format.json { head :no_content }
    end
  end

  def actions
    @group = Group.find(params[:id])
  end

  def export
    @group = Group.find(params[:id])
    @members = Member.where(group_id: @group.id).order("is_trainer DESC, name ASC")
    @practices = Practice.where(group_id: @group.id).order("date ASC")

    respond_to do |format|
      format.html
      format.csv { render text: @group.to_csv }
      format.xls
    end
  end
end
