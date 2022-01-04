class RoomsController < ApplicationController
  skip_before_action :require_logout
  before_action :set_room, only: %i[show edit update destroy]

  # GET /rooms or /rooms.json
  def index
    @rooms = Room.all
  end

  # GET /rooms/1 or /rooms/1.json
  def show
    @rooms = Room.all
    render 'rooms/index'
  end

  # GET /rooms/new
  def new
    @room = Room.new
  end

  # GET /rooms/1/edit
  def edit; end

  # POST /rooms or /rooms.json
  def create
    @room = Room.new(room_params)

    respond_to do |format|
      if @room.save
        format.html do
          redirect_to @room, notice: 'Room was successfully created.'
        end
        format.json { render :show, status: :created, location: @room }
      else
        redirect_to new_post_image_url,
          alert: 'Room cannot be created check fields.'
      end
    end
  end

  # PATCH/PUT /rooms/1 or /rooms/1.json
  # def update
  #   respond_to do |format|
  #     if @room.update(room_params)
  #       format.html do
  #         redirect_to @room, notice: 'Room was successfully updated.'
  #       end
  #       format.json { render :show, status: :ok, location: @room }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #       format.json { render json: @room.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # DELETE /rooms/1 or /rooms/1.json
  # def destroy
  #   @room.destroy
  #   respond_to do |format|
  #     format.html do
  #       redirect_to rooms_url, notice: 'Room was successfully destroyed.'
  #     end
  #     format.json { head :no_content }
  #   end
  # end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_room
    @room = Room.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def room_params
    params.require(:room).permit(:name)
  end
end
