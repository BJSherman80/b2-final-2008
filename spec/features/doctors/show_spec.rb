require 'rails_helper'


RSpec.describe 'as a visitor', type: :feature do
  it 'can see doc info and hospital they work at along with patients they have info' do
    hospital = Hospital.create!(name: "Banner Health AZ")
    doctor_1 = hospital.doctors.create!(name: "Blake Sherman", specialty: "ER Doc", university: "CU Denver Anchutz")
    patient_1 = Patient.create!(name: "Brett Sherman", age: '20')
    patient_2 = Patient.create!(name: "Chad Sipe", age: '28')
    doctor_1.patients << patient_1
    doctor_1.patients << patient_2

    visit "/doctors/#{doctor_1.id}"

    expect(page).to have_content(doctor_1.name)
    expect(page).to have_content(doctor_1.specialty)
    expect(page).to have_content(doctor_1.university)
    expect(page).to have_content(patient_1.name)
    expect(page).to have_content(patient_2.name)
  end

  it 'delete a patient from a doctor show page' do
    hospital = Hospital.create!(name: "Banner Health AZ")
    doctor_1 = hospital.doctors.create!(name: "Blake Sherman", specialty: "ER Doc", university: "CU Denver Anchutz")
    patient_1 = Patient.create!(name: "Brett Sherman", age: '20')
    patient_2 = Patient.create!(name: "Chad Sipe", age: '28')
    doctor_1.patients << patient_1
    doctor_1.patients << patient_2

    visit "/doctors/#{doctor_1.id}"

    within "#patient-#{patient_1.id}" do
      click_on "Delete Appointment"
    end
    expect(current_path).to eq("/doctors/#{doctor_1.id}")
    expect(page).to_not have_content(patient_1.name)
  end
end
