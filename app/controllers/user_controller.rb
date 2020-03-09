class UserController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        type_count = User.where(raffle_types_id: @user.raffle_types_id).count
        format.html { redirect_to new_user_path, notice: @user.odds_msg(type_count) }
      else
        @user.errors.full_messages.each do |msg|
          format.html { redirect_to new_user_path, alert: "#{msg}"}
        end
      end
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :raffle_types_id)
  end
end
