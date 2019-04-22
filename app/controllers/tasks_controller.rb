class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :set_to_do_list

  # GET /tasks
  def index
    @tasks = @to_do_list.tasks
  end

  # GET /tasks/1
  def show
  end

  def done
    @tasks=task.is_completed:true
    @tasks.save
  end
  # GET /tasks/new
  def new
    @task = @to_do_list.tasks.build
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  def create
    
    @task = @to_do_list.tasks.build(task_params)

    if @task.save
      redirect_to to_do_list_tasks_url, notice: 'Task was successfully created.' 
    else
      render :new 
    end
  end

  # PATCH/PUT /tasks/1
  def update
      if @task.update(task_params)
        redirect_to to_do_list_tasks_path(to_do_list_id: @task.to_do_list_id)
      else
        render :edit 
      end
  end

  # DELETE /tasks/1
  def destroy
    @task.destroy
    redirect_to to_do_list_tasks_path(to_do_list_id: @task.to_do_list_id)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    def set_to_do_list
      @to_do_list = ToDoList.find(params[:to_do_list_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:description, :is_completed, :to_do_list_id)
    end
end
