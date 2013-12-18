CfHdfsBroker::Application.routes.draw do
  namespace :v2 do
    resource :catalog, only: [:show]
    resources :service_instances, only: [:update, :destroy] do
      resources :service_bindings, only: [:update, :destroy]
    end
  end
end
