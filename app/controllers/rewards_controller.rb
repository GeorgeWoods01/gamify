class RewardsController < ApplicationController
  def index
    @rewards = Reward.all
  end

  def show
    @reward = Reward.find(params[:id])
  end

  def new
    @reward = Reward.new
  end

  def create
    @reward = Reward.new(reward_params)
    @reward.user = current_user
    if @reward.save
      redirect_to rewards_path(@rewards)
    else
      render :new
    end
  end

  def destroy
    @reward = Reward.find(params[:id])
    @reward.destroy

    redirect_to rewards_path(@rewards)
  end

  private

  def reward_params
    params.require(:reward).permit(:title, :description, :price, :photo)
  end
end
