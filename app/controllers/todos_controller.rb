class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :update, :destroy]

  def index
    @todo = Todo.new
    @todos = Todo.all
  end

  def show
  end

  def update
    if @todo.update(todo_params)
      redirect_to action: :index,  notice: 'Todo was successfully updated.'
      return
    end
    redirect_to action: :index, notice: 'Todo update failed.'
  end

  def destroy
    @todo.destroy
    redirect_to action: :index, notice: "Task was successfully destroyed.", status: :see_other
  end

  def create
    @todo = Todo.new(todo_params)

    if @todo.save
      redirect_to action: :index, notice: 'Todo was successfully created.'
    else
      redirect_to action: :index, notice: 'Todo save failed.'
    end
  end

  private

  def set_todo
    @todo = Todo.find(params[:id])
  end

  def todo_params
    params.require(:todo).permit(:content)
  end
end
