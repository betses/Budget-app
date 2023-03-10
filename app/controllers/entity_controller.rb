class EntityController < ApplicationController
  load_and_authorize_resource

  def index
    redirect_to groups_url
  end

  def new
    @expense = Entity.new
  end

  def create
    @new_expense = Entity.new(expense_params)
    @new_expense.user = current_user

    respond_to do |format|
      if @new_expense.save
        format.html { redirect_to @new_expense.groups.first, notice: 'Expense was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @expense = Entity.find(params[:id])
    @expense.destroy
    flash[:success] = 'Expense was successfully deleted.'
    redirect_to root_path
  end

  def expense_params
    params.require(:entities).permit(:name, :amount, group_ids: [])
  end
end
