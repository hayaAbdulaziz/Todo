class TodosController < ApplicationController
  before_action :authenticate_user!, only: [:new, :show]
  before_action :find_todo, except: [:index, :new, :create]
  def destroy
    @todo.delete
    
  end 
  def edit 
    @todo = Todo.find(params[:id])
  end 
  def ubdate 
    @todo = Todo.find(params[:id])
  end 
    def show 
    @todo = Todo.find(params[:id])
    if @todo.user != current_user
        redirect_to todos_path
      end
    end 
    def index
       @todos = current_user.todos.all
    end 
    def new 
        @todo = Todo.new
    end 
    def create 
        @todo = Todo.new(todo_params)
        @todo.user = current_user
        if @todo.save
            redirect_to @todo
          else
            render 'new'
       end
        
    end 
    private 
    def todo_params
        params.require(:todo).permit(:title, :completed, :description)
    end
    def find_todo 
        @todo =Todo.find(params[:id])
    end 
end
