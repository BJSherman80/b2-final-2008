class AppointmentsController < ApplicationController

  def destroy
    appointment = Appointment.find_by(doctor_id: params[:doc_id] , patient_id: params[:patient_id])
      appointment.destroy
    redirect_to "/doctors/#{params[:doc_id]}"
  end

end
