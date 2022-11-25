class Api::V1::DoctorsController < ApplicationController
  def index
    @doctors = Doctor.all
    render json: @doctors
  end

  def show
    @doctor = Doctor.find(params[:id])
    render json: @doctor
  end

  def create
    # Only the admin user should create the user
    @doctor = Doctor.new(doctor_params)
    if @doctor.save
      render json: @doctor, status: :created
    else
      render json: { error: 'Error creating doctor' }, status: :unprocessable_entity
    end
  end

  def update
    @doctor = Doctor.find(params[:id])
    if @doctor.update(doctor_params)
      render json: @doctor
    else
      render json: @doctor.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @doctor = Doctor.find(params[:id])
    @doctor.destroy
    render json: Doctor.all
  end

  def show_user_doctors
    @doctors = Doctor.all.where(user_id: params[:id])
    render json: @doctors
  end

  private

  def doctor_params
    params.require(:doctor).permit(:user_id, :name, :specialization, :photo)
  end
end
