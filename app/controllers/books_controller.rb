class BooksController < ApplicationController
  respond_to :html, :xml, :json
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = list_books
    respond_with @books
  end

  def best_rated
    @books = Book.best_rated.order(:title).page params[:page]
    respond_with @books
  end

  def show
    respond_with @books
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    flash[:notice] = "#{@book.title} was created!" if @book.save
    respond_with @book
  end

  def edit
  end

  def update
    flash[:notice] = "#{@book.title} was updated!" if @book.update(book_params)
    respond_with @book
  end

  def destroy
    @book.destroy
    redirect_to books_url, alert: "#{@book.title} was deleted!"
  end

  private

  def list_books
    Book.includes(:reviews).order(:title).page params[:page]
  end

  def book_params
    params.require(:book).permit(:title, :author, :pages, :price, :image, :description)
  end

  def set_book
    @book = Book.find(params[:id])
  end

end

