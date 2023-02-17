class UsersController < ApplicationController
    before_action :require_user, only: [:index, :show]
    def new
        @user = User.new
    end
    def index
      if session[:user_id] == nil
        redirect_to login_path
      else
        @user = User.find_by(id:session[:user_id] )
      end
    end

    def create
      @user = User.create(name: user_params[:name], email: user_params[:email], password: user_params[:password] )
      @user.create_address(place: user_params[:address])
      if @user.valid?
        session[:user_id] = @user.id
        redirect_to login_path
      else
        redirect_to users_path
      end
    end

    def show
      @user = User.find_by(id:session[:user_id] )
    end

    private
    def user_params
        params.require(:user).permit(:name, :email, :password, :address)
    end
end
