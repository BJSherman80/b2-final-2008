require 'rails_helper'


RSpec.describe 'Hospitals show page', type: :feature do
  it 'can see doc info and hospital they work at along with patients they have info' do
    hospital = Hospital.create!(name: "Banner Health AZ")
    doctor_1 = hospital.doctors.create!(name: "Blake Sherman", specialty: "ER Doc", university: "CU Denver Anchutz")
    doctor_2 = hospital.doctors.create!(name: "Hayden Sherman", specialty: "Heart Doc", university: "ASU")


    visit "/hospitals/#{hospital.id}"
    
    expect(page).to have_content(hospital.name)
    expect(page).to have_content("Number of Doctors: 2")
    expect(page).to have_content(doctor_1.university)
    expect(page).to have_content(doctor_2.university)
  end
end
