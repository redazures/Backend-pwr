class PatientsController < ApplicationController
    
    def index
        patients = Patient.current_patients
        render json:patients
    end

end
