class EntliesController < ApplicationController
  before_action :set_ently, only: [:show, :edit, :update, :destroy]

  def show
    @user = User.find(params[:user_id])
  end


  def new
    @ently = current_user.entlies.build
  end

  def edit
  end

  def create
    @ently = current_user.entlies.build(entry_params)

    respond_to do |format|
      if @ently.save
        format.html { redirect_to user_ently_path(current_user.id, @ently.id), notice: 'Ently was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @ently.update(entry_params)
        format.html { redirect_to user_ently_path(current_user.id, @ently.id), notice: 'Ently was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end


  def destroy
    @ently.destroy
    respond_to do |format|
      format.html { redirect_to current_user.entlies.present? ? user_path(current_user) : "/", notice: 'Ently was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ently
      @ently = Ently.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entry_params
      params.require(:ently).permit(:content)
    end
end
