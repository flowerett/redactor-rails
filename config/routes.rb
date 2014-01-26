RedactorRails::Engine.routes.draw do
  resources :pictures,  :only => [:index, :create]
  resources :documents, :only => [:index, :create]
  resources :audio, :only => [:index, :create]
  resources :video, :only => [:index, :create]
end
