class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  def index
    @books = Book.all
  end

  def show
  end

  def new
    @book = Book.new
  end

  def edit
  end

  def create
    @book = Book.new(books_params)
    if @book.save
      redirect_to books_path
      flash[:notice] = "#{@book.title} was created."
    else
      render :new
    end
  end

  def update
    if @book.update(books_params)
      redirect_to books_path
      flash[:notice] = "#{@book.title} was updated."
    else
      render :edit
    end
  end

  def destroy
    @book.destroy if can_delete_book
  end

  private

  def books_params
    params.require(:book).permit(:title, :author, :summary, :photo, :status)
  end

  def set_book
    @book = Book.find(params[:id])
  end

  def can_delete_book
    if @book.status == 'available'
      true
    else
      false
    end
  end
end
