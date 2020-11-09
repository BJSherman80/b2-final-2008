require 'rails_helper'

RSpec.describe Hospital, type: :model do
  describe 'relationships' do
  it { should have_many :doctors }
  it { should have_many(:patients).through(:doctors) }
 end

 describe 'instance methods' do
   before(:each) do
     @hospital = Hospital.create!(name: "Banner Health AZ")
     @doctor_1 = @hospital.doctors.create!(name: "Blake Sherman", specialty: "ER Doc", university: "CU Denver Anchutz")
     @doctor_2 = @hospital.doctors.create!(name: "Hayden Sherman", specialty: "Heart Doc", university: "ASU")
   end
   it '.doc_count' do
     expect(@hospital.doc_count).to eq(2)
   end

   it '.doc_universities' do
     expect(@hospital.doc_universities).to eq([@doctor_1.university, @doctor_2.university])
   end
 end
end
