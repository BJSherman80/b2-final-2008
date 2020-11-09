Rails.application.routes.draw do
  resources :doctors, only: [:show]
  resources :patients, only: [:index]
  resources :hospitals, only: [:show]

  delete '/doctors/:doc_id/patients/:patient_id', to: 'appointments#destroy'
end
