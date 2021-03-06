class PatientsController < ApplicationController
  before_action :find_patient, only: [:show, :edit, :update, :destroy]

  def index
    if user_signed_in?
      @patients = Patient.where(:user_id => current_user.id).order("created_at DESC")
      @patients = Patient.search(params[:search])
    end
  end

  def show
  end

  def new
    @patient = current_user.patients.build
  end

  def create
    @patient = current_user.patients.build(patient_params)
    if @patient.save
      flash[:notice] = "Patient was successfully created."
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @patient.update(patient_params)
      redirect_to patient_path(@patient)
    else
      render 'edit'
    end
  end

  def destroy
    @patient.destroy
    redirect_to root_path
  end

  private
    def patient_params
      params.require(:patient).permit(:name, :surname, :address, :date_of_birth, :phone_no, :medical_card, :medical_insurance)
    end

    def find_patient
      @patient = Patient.find(params[:id])
    end
end
