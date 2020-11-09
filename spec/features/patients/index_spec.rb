require 'rails_helper'


RSpec.describe 'as a visitor', type: :feature do
  it 'can see all patients listed from oldest to youngest' do
    patient_1 = Patient.create!(name: "Brett Sherman", age: 20)
    patient_2 = Patient.create!(name: "Chad Sipe", age: 28)
    patient_3 = Patient.create!(name: "Hayden Sherman", age: 12)
    patient_4 = Patient.create!(name: "Shania Hernandez", age: 24)

    visit "/patients"
    save_and_open_page
    #using orderly gem
    expect(patient_2.name).to appear_before(patient_4.name)
    expect(patient_1.name).to appear_before(patient_3.name)
  end
end
