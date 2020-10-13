class PatientSerializer < ActiveModel::Serializer
  attributes :id, :name, :hospital_patient_id

  has_many :ledgers
  has_many :users, through: :ledgers
end