class RewardTransactionsController < ApplicationController
  def index
    @reward_transactions = RewardTransaction.where(reward_transaction_id: params[:reward_transaction_id])
  end

  def new
    @reward_transaction = RewardTransaction.new
    @reward = Reward.find(params[:reward_id])
  end

  def create
    @reward = Reward.find(params[:reward_id])
    @student = Student.find(params[:reward_transaction][:student_id])
    if @student.coins > @reward.price
      @reward_transaction = RewardTransaction.new(student: Student.find(params[:reward_transaction][:student_id]))
      @reward_transaction.reward = @reward
      @student.coins -= @reward.price
      @student.save
      @reward_transaction.save
      redirect_to root_path
    else
      @reward_transaction = RewardTransaction.new
      render "new"
      flash[:alert] = 'You cant buy this!'
    end
  end
end
