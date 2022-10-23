class TransactionsController < ApplicationController
  def index
    @transactions = Transaction.find_by(user_id: current_user)
  end

  def show
  end

  def new
    @transaction = Transaction.new
  end

  def edit
    authorize User
  end

  def update
    authorize User
  end

  private
  def set_transaction
    @transaction = Transaction.find(params[:id])
  end
end