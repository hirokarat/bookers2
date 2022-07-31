class BooksController < ApplicationController
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id),notice:'You have created book successfully.'
    else
      @books=Book.all
      @user=User.find(current_user.id)
      render:index
    end
  end

  def index
    @books=Book.all
    @book=Book.new
    @user=User.find(current_user.id)
  end

  def show
    @book=Book.find(params[:id])
    @user=@book.user
    redirect_to books_path if @book.blank?
  end
  
  def edit
    @book=Book.find(params[:id])
    redirect_to books_path unless current_user.id == @book.user_id
  end
  
  def update
    @book=Book.find(params[:id])
    if @book.update(book_params)
       redirect_to book_path(@book.id),notice:'You have updated book successfully.'
    else
       render:edit
    end
  end
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end
  
  # 投稿データのストロングパラメータ
  private

  def book_params
    params.require(:book).permit(:title,:body)
  end
  
   
  
end
