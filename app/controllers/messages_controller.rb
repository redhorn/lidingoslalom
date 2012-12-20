class MessagesController < ApplicationController
	def index
		@messages = Message.order("updated_at DESC")
	end

  def new
    @message = Message.new

    respond_to do |format|
      format.html
      format.json { render json: @message }
    end
  end

  def edit
		@message = Message.find(params[:id])
	end

	def create
		@message = Message.new(params[:message])

    respond_to do |format|
      if @message.save
        format.html { redirect_to messages_path, notice: 'Message was successfully created.' }
        format.json { render json: @message, status: :created, location: @message }
      else
        format.html { render action: "new" }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

	def update
    @message = Message.find(params[:id])

    respond_to do |format|
      if @message.update_attributes(params[:message])
        format.html { redirect_to messages_path, notice: 'Message was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
	end

	def destroy
    @message = Message.find(params[:id])
    @message.destroy

    respond_to do |format|
      format.html { redirect_to messages_path }
      format.json { head :no_content }
    end	end
end
