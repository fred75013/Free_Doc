class Specialty < ApplicationRecord
    has_many :joindoctorspecialties
    has_many :doctors, through: :joindoctorspecialties
end
