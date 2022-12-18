class GroupController < ApplicationController
    def index
        @groups = Group.order(:name)
        end

    def new
        @group = Group.new
    end

    def show
        @group = Group.find(params[:id])
        @entities = @group.expenses.order('created_at DESC')
    end

    def create
        @new_group = Group.new(group_params)
        @new_group.user = current_user
    
        respond_to do |format|
          if @new_group.save
            format.html { redirect_to root_path, notice: 'Category was successfully created.' }
          else
            format.html { render :new, status: :unprocessable_entity }
          end
        end
    end

      def destroy
        @group = Group.find(params[:id])
        @group.destroy
        respond_to do |format|
          format.html { redirect_to groups_url, notice: 'Category was successfully destroyed!.' }
        end
      end

      private

      def set_group
        @group = Group.includes(:entities).find(params[:id])
      end
    
      def group_params
        params.require(:group).permit(:name, :icon)
      end
end
