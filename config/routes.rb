Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :race_registrations do
    resources :registrations, :only => [:index,:show, :create] do
      collection do
        post :redirect
      end
     resources :categories, :only => :index
    end


    resources :people, :only => [:index, :new, :create, :show]
    resources :categories, :only => [:index, :show]
    resources :groups, :only => [:index, :show]
  end

  # Admin routes
  namespace :race_registrations, :path => '' do
    namespace :admin, :path => 'refinery/race_registrations' do
      resources :registrations, :except => :show do
        collection do
          post :update_positions
        end
        resources :categories, :only => :index
      end

      resources :people, :except => :show

      resources :categories, :except => :show do
        collection do
          post :update_positions
        end
      end

      resources :groups, :except => :show do
        collection do
          post :update_positions
        end
      end

    end
  end
end
