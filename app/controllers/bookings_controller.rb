class BookingsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_booking, only: %w[show edit update destroy]

    def index
       @bookings = Booking.all
    end

    def show
    end

    def new
       @booking = Booking.new
    end

    def create
       @booking = Booking.new(bookings_params)

        respond_to do |format|
           if @booking.save
                format.html { redirect_to bookings_path}
           else
                format.html { render :new, status: :unprocessable_entity}
           end
        end
    end

    def edit
    end

    def update
        respond_to do |format|
            if @booking.update(bookings_params)
               format.html{ redirect_to @booking, notice: "Booking has been updated successfully" }
            else
                format.html { render :edit, status: :unprocessable_entity}
            end
        end
    end

    def destroy
        respond_to do |format|
            if @booking.destroy
               format.html{ redirect_to bookings_path, notice: "Booking has been deleted successfully" }
            else
                format.html { render booking_path(@booking), status: :unprocessable_entity}
            end
        end
    end

    private
    def set_booking
        @booking = Booking.find(params[:id])
    end

    private
    def bookings_params
        params.require(:booking).permit(:start, :end, :purpose, :room_id, :user_id)
    end
end
