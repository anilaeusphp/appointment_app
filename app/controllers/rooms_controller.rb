class RoomsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_room, only: %w[show edit update destroy]

    def index
       @rooms = Room.all
    end

    def show
    end

    def new
       @room = Room.new
    end

    def create
        respond_to do |format|
           @room = Room.create(rooms_params)
           if @room.save
            format.html { redirect_to room_url(@room), notice: "Room has been created successfully" }
           else
            format.html { render :new, status: :unprocessable_entity }
           end
        end
    end

    def edit
    end

    def update
        respond_to do |format|
           if @room.update(rooms_params)
            format.html{ redirect_to room_path(@room), notice: "Room has been updated succesfully"}
           else
               format.html {render :edit, status: :unprocessable_entity}
           end
        end
    end

    def destroy
        respond_to do |format|
           if @room.destroy
            format.html{ redirect_to rooms_path, notice: "Room has been deleted succesfully"}
           else
               format.html {render room_path(@room), status: :unprocessable_entity}
           end
        end
    end

    private
    def set_room
       @room = Room.find(params[:id])
    end

    private
    def rooms_params
        params.require(:room).permit(:name, :capacity)
    end

end