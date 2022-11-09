class TransactionsController < ApplicationController
  before_action :set_categories, only: [:new, :edit]
  before_action :set_transaction, only: [:edit, :update]

  def index
    # @transactions = Transaction.find_by(user_id: current_user)
    @transactions = Transaction.all
  end

  def show
  end

  def new
    @transaction = Transaction.new
    # @categories = Categories.all()
  end

  def create
    @transaction = Transaction.new(transaction_params);
    @transaction.user = current_user
    if @transaction.save
      flash[:success] = "Transaction was successfully created"
      redirect_to transactions_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
    authorize User
  end

  def update
    authorize User
    if @transaction.update(transaction_params)
      flash[:success] = "The transaction was successfully updated"
      redirect_to transactions_path
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  private
  def set_transaction
    @transaction = Transaction.find(params[:id])
  end

  def set_categories
    @income_categories = Category.where(transaction_type: Category::TRANSACTION_TYPES[0]).collect { |c| [c.name, c.id] }
    @expense_categories = Category.where(transaction_type: Category::TRANSACTION_TYPES[1]).collect { |c| [c.name, c.id] }
  end

  def transaction_params
    params.require(:transaction).permit(:amount, :currency_type, :note, :transaction_type, :transaction_date, :category_id)
  end

  # def require_same_user
  #   current_user = user
  # end
end