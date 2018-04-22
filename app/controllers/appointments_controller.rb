class AppointmentsController < ApplicationController
  before_action :find_appointment, only: [:show, :edit, :update, :destroy]

  def index
    @appointments = Appointment.all.order("created_at DESC")
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)

    if @appointment.save
      redirect_to @appointment
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @appointment.update(appointment_params)
      redirect_to @appointment
    else
      render 'edit'
    end
  end

  def destroy
    @appointment.destroy
    redirect_to root_path
  end

  private
    def appointment_params
      params.require(:appointment).permit(:date, :time, :doctor)
    end
end
