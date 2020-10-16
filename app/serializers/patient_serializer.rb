class PatientSerializer < ActiveModel::Serializer
  attributes :id, :name, :hospital_patient_id, :room, :main_practitioner, :main_practitioner_title

  has_many :ledgers
end