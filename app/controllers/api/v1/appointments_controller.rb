class Api::V1::AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :update, :destroy]
  
  # GET /appointments
  def index
    appointments = Appointment.all
    render json: appointments
  end

   # POST /appointments
  def new
    appointment = Appointment.new
  end

  def create
    appointment = Appointment.new(appointment_params)
    appointment.user_id = current_user.id
    if appointment.save
      render json: appointment
    else
      render json: {error: 'Error creating appointment'}
    end
  end

  # GET /appointments/1
  def show
    render json: appointment
  end

  # PATCH/PUT /appointments/1
  def update
    appointment.update(appointment_params)
    if appointment.save
      render json: appointment
    else
      render json: {error: 'Error updating appointment'}
    end
  end

  # DELETE /appointments/1
  def destroy
    appointment.destroy
    render json: appointment
  end

  private

  def set_appointment
    appointment = Appointment.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:date_of_appointment, :time_of_appointment, :description, :doctor_id)
  end

end
