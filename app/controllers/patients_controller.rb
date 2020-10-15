class PatientsController < ApplicationController
    
    def index
        patients = Patient.current_patients

        render json:patients
    end

    def create
        # binding.pry
        patient = Patient.create(name:params["name"],current:true,hospital_patient_id:rand(1000..9999))
        ledger = Ledger.create(user_id:User.all.sample.id, patient_id:patient.id,current_room:params["room"],description:params["description"])
        render json:patient
    end

    private

    def patient_params
        params.require(:patient).params(:name, :current, :hospital_patient_id, :room, :description )
    end

end
