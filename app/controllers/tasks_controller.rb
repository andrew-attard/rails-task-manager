class TasksController < ApplicationController
  # /tasks
  def index
    @tasks = Task.all
  end

  # tasks/1
  # 'params' is a rails provided keyword and stores any values passed in the URL
  def show
    @task = Task.find(params[:id])
  end

  # When we route to the /new path, this will initiate a new (empty) instance of
  # a task
  def new
    @task = Task.new
  end

  # To create a new tasks instance with the user inputs, we give it a hash with
  # the key/value pairs.  In this case, we pass it the private method task_params
  # since we want to only pass in the filtered values
  def create
    @task = Task.new(task_params)
    # A conditional is normally added here based on the success or failure of
    # saving the new record. In order to be saved, the record must pass all
    # validations (normally defined in the model), such as 'Title must be present'
    # or 'E-mail must match x RegEx pattern', must be an integer, etc.
    if @task.save
      # If successful, then redirect to the task_path, defined in the router as:
      # get '/task/:id', to: 'tasks#show', as: :task
      # and pass it the task instance we just created. Rails is smart enough to
      # find and use the :id
      redirect_to task_path(@task)
    else
      # If the task is not successfully created, then render the form again, but
      # with our existing @task instance values already populated
      render 'new', status: :unprocessable_entity
    end
  end

  # To prevent potentially malicious insert into the DB, we should filter permissable
  # inputs, where 'params' contains the attributes (hash) required for creating a
  # new @task instance
  # To do this, we define the table/model (:task), and then the fields we allow
  # updating (:title, :details)
  private

  def task_params
    params.require(:task).permit(:title, :details)
  end
end
