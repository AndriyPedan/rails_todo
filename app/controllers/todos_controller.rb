class TodosController < ApplicationController
  before_action :set_todo_list
  before_action :set_todo, except: [:create]

  def create
    @todo = @todo_list.todos.create(todo_params)
    redirect_to @todo_list
  end

  def destroy
    @todo.destroy
    redirect_via_turbolinks_to @todo_list
  end

  def complete
    @todo.update_attribute(:completed_at, Time.now)
    redirect_via_turbolinks_to @todo_list
  end

  private

  def set_todo
    @todo = @todo_list.todos.find(params[:id])
  end

  def set_todo_list
    @todo_list = TodoList.find(params[:todo_list_id])
  end

  def todo_params
    params[:todo].permit(:task)
  end
end
