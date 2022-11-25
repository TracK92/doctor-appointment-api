class Api::V1::AppointmentsController < ApplicationController
  before_action :set_appointment, only: %i[show update destroy]

  # GET /appointments
  def index
    @appointments = Appointment.all
    render json: @appointments, status: :ok
  end

  # POST /appointments
  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.user_id = params[:user_id]
    if @appointment.save
      render json: @appointment, status: :created
    else
      render json: { error: 'Error creating appointment' }, status: :unprocessable_entity
    end
  end

  # GET /appointments/1
  def show
    render json: @appointment, status: :ok
  end

  # PATCH/PUT /appointments/1
  def update
    @appointment.update(appointment_params)
    if @appointment.save
      render json: @appointment, status: :ok
    else
      render json: { error: 'Error updating appointment' }, status: :unprocessable_entity
    end
  end

  # DELETE /appointments/1
  def destroy
    @appointment.destroy
    render json: @appointment, status: :ok
  end

  private

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:date_of_appointment, :time_of_appointment, :description, :doctor_id)
  end
end
