class UsersController < ApplicationController
  
  
  def index
    @users=User.all
    @user=User.find(current_user.id)
  end
  
  def show
    @user=User.find(params[:id])
    @book=Book.new
    @books=@user.books
  end

  def edit
    @user=User.find(params[:id])
    redirect_to user_path(current_user.id) unless current_user.id == @user.id
  end
  
  def update
    @user=User.find(params[:id])
    if @user.update(user_params)
       redirect_to user_path(@user.id),notice:'You have updated user successfully.'
    else
      render:edit
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :introduction,:profile_image)
  end
  
  
  
end
