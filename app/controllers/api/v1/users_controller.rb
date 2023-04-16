module Api
  module V1
    class UsersController < ApiController
      def detail
        @user = User.find_by(email: params[:email])
        render json: @user
      end

      def update
        @user = User.find(params[:id])
        if @user.update(user_params)
          render json: @user, status: :ok
        else
          render json: { errors: @user.errors }, status: :unprocessable_entity
        end
      end

      private
      def user_params
        params.require(:user).permit(:name)
      end
    end
  end
end