Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Read all tasks
  get '/tasks', to: 'tasks#index', as: :tasks

  # Create
  # Routing to the path 'new_task_path' will take the user to the view 'new.html.erb'
  # containing the form to POST a new task
  get '/tasks/new', to: 'tasks#new', as: :new_task
  # Another action to create the instance from the form data
  post '/tasks', to: 'tasks#create'

  # Show a single task, passing :id in the params
  get '/tasks/:id', to: 'tasks#show', as: :task

  # Edit follows a similar structure to create, except in this case we must specify
  # the task we wish to edit/update by :id
  # The 'get' route takes us to the form (which we can re-use with render)
  get '/tasks/:id/edit', to: 'tasks#edit', as: :edit_task
  # The 'post' route completes the upate method defined in the controller, which
  # finds the task by its Id, attempts to update it, then either redirects the user
  # to the updated task (if update is successful) or renders the form with its
  # existing values if the update was not successful
  patch '/tasks/:id', to: 'tasks#update'

  # Defines the root path route ("/")
  # root "posts#index"
end
