class PatientsController < ApplicationController
    
    def index
        patients = Patient.current_patients
        render json: patients
    end

    def create
        # binding.pry
        patient = Patient.create(name:params["name"],current:true,hospital_patient_id:params["patient_id"])
        ledger = Ledger.create(user_id:User.all.sample.id, patient_id:patient.id,current_room:params["room"],description:params["description"])
        # params["images"].each{|image|ledger.images.attach(image)}
        params["images"].each do |image|
            ledger.images.attach(image)
        end
        render json:patient
    end

    private

    def patient_params
        params.require(:patient).params(:name, :current, :hospital_patient_id, :room, :description,images:[] )
    end

end
