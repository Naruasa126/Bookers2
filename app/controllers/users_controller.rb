class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @book = @user.books
    @user_path = Book.new
  end

  def create
    @user = User.new(post_image_params)
    @user.user_id = current_user.id
    if @user.save
      flash[:success] = "Welcome! You have signed up successfully."
     redirect_to user_path
    else
      flash.now[:danger] = "error"
      render :new
    end
  end

  def index
    @user = current_user
    @users = User.all
    @user_path = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(users_params)
      flash[:success]='You have updated user successfully.'
     redirect_to user_path
    else
      flash.now[:danger] = "error"
     render :edit
    end
  end


  private
  def users_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
