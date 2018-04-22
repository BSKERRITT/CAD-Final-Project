class RecordsController < ApplicationController
  before_action :find_record, only: [:show, :edit, :update, :destroy]

  def index
    @records = Record.all.order("created_at DESC")
  end

  def show
  end

  def new
    @patient = Patient.find(params[:patient_id])
    @record = Record.new
  end

  def create
    @patient = Patient.find(params[:patient_id])
    @record = @patient.records.create(record_params)

    if @record.save
      redirect_to patient_path(@patient)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @record.destroy
    redirect_to patient_path
  end

  private
    def record_params
      params.permit(:observation, :previous_condition, :blood_test, :sick_note)
    end

    def find_record
      @record = Record.find(params[:id])
    end
end
