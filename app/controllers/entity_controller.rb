class EntityController < ApplicationController
  def index
    redirect_to groups_url
  end

  def new
    @expense = Entity.new
  end

  def create
    # @group_id = params.require(:expense).permit(:group_id)
    # @group = Group.find_by(id: @group_id['group_id'])
    # @group = Group.find(params[:group_id])
    @new_expense = Entity.new(expense_params)
    @new_expense.user = current_user

    respond_to do |format|
      if @new_expense.save
        format.html { redirect_to group_index_path, notice: 'Expense was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end
   
  def destroy
    @expense = Expense.find(params[:id])
    @expense.destroy
    flash[:success] = 'Expense was successfully deleted.'
    redirect_to root_path
  end

  def expense_params
    params.require(:entities).permit(:name, :amount, group_ids: [])
  end

end

