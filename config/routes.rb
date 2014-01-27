RedactorRails::Engine.routes.draw do
  resources :pictures,  :only => [:index, :create]
  resources :documents, :only => [:index, :create]
  resources :audios, :only => [:index, :create]
  resources :videos, :only => [:index, :create]
end
