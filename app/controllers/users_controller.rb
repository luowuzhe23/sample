class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # 处理注册成功的情况
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      # todo
      render 'new'
    end

  end

  private

  # 健壮参数
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end


end
