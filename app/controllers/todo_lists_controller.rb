class TodoListsController < ApplicationController
  def index
    @todo_lists = TodoList.all
  end

  def create
    @todo_list = TodoList.create(todo_list_params)
    @todo_list.update_attribute(:user_id, current_user.id)
    redirect_via_turbolinks_to todo_lists_path
  end

  def update
    @todo_list = TodoList.find(params[:id])
    @todo_list.update(todo_list_params)
    redirect_via_turbolinks_to @todo_list
  end

  def destroy
    @todo_list = TodoList.find(params[:id])
    @todo_list.destroy
    redirect_via_turbolinks_to @todo_list
  end

  def new
    @todo_list = TodoList.new
  end

  def show
    @todo_list = TodoList.find(params[:id])
  end

  def edit
    @todo_list = TodoList.find(params[:id])
  end

  private

  def todo_list_params
    params.require(:todo_list).permit(:title, :description)
  end
end
