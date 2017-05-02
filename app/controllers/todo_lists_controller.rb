class TodoListsController < ApplicationController
  before_action :set_todo, only:[:show, :edit, :update, :destroy]
  def index
    @todos = TodoList.all
    @todo = TodoList.new
  end

  def show
  end

  def edit
  end

  def create
    @todo = TodoList.new todo_list_params
    if @todo.save
      redirect_to todo_lists_path, notice: 'Todoが正しく作成されました！'
    else
      redirect_to todo_lists_path, alert: '作成に問題が発生したため、入力情報をチェックしてからもう一回提出してください'
    end
  end

  def update
    if @todo.update todo_list_params
      redirect_to todo_lists_path, notice: 'Todoが正しく更新されました！'
    else
      flash[:alert] = '更新に問題が発生したため、入力情報をチェックしてからもう一回提出してください'
      render :edit
    end
  end

  def destroy
    @todo.destroy
    redirect_to todo_lists_path, notice: 'Todoが正しく削除されました。'
  end

  private

  def set_todo
    @todo = TodoList.find params[:id]
  end

  def todo_list_params
    params.require(:todo_list).permit(:id, :title, :description)
  end
end
