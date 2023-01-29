module Api
  module V1
    class TransactionsController < ApiController
      def index
        @transactions = Transaction.where(user_id: params[:user_id])

        render json: @transactions
      end

      def create
        @transaction = Transaction.new(transaction_params)
        if @transaction.save
          render json: @transaction, status: :created
        else
          render json: { errors: @transaction.errors }, status: :unprocessable_entity
        end
      end

      def update
        @transaction = Transaction.find(params[:id])
        if @transaction.update(transaction_params)
          render JSON: @transcation, status: :ok
        else
          render json: { errors: @transcation.errors }, status: :unprocessable_entity
        end
      end

      private
      def transaction_params
        params.require(:transaction).permit(:amount, :currency_type, :note, :transaction_type, :transaction_date, :category_id, :user_id)
      end
    end
  end
end