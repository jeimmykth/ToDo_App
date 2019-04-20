class ToDoListsController < ApplicationController
  before_action :set_to_do_list, only: [:show, :edit, :update, :destroy]

  # GET /to_do_lists
  def index
    @to_do_lists = ToDoList.all
  end

  # GET /to_do_lists/1
  def show
  end

  # GET /to_do_lists/new
  def new
    @to_do_list = ToDoList.new
  end

  # GET /to_do_lists/1/edit
  def edit
  end

  # POST /to_do_lists
  def create
    @to_do_list = ToDoList.new(to_do_list_params)
    @to_do_list.user_id = current_user.id

    if @to_do_list.save
      redirect_to @to_do_list, notice: 'To do list was successfully created.'
    else
      render :new 
    end
  end

  # PATCH/PUT /to_do_lists/1
  def update
      if @to_do_list.update(to_do_list_params)
        redirect_to @to_do_list, notice: 'To do list was successfully updated.'
      else
        render :edit 
      end
  end

  # DELETE /to_do_lists/1
  def destroy
    @to_do_list.destroy
    redirect_to to_do_lists_url, notice: 'To do list was successfully destroyed.' 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_to_do_list
      @to_do_list = ToDoList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def to_do_list_params
      params.require(:to_do_list).permit(:title, :description)
    end
end
