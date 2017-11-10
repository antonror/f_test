class MovementsController < ApplicationController
  before_action     :set_book

  def new
    @movement = @book.movements.new
  end

  def show
    @movement = @book.movements.find(params[:id])
  end

  def take
    @movement = @book.movements.new(movement_params)
    if @movement.save
      flash[:notice] = 'Thanks for taking the book!'
      redirect_to book_path(@book)
    else
      flash[:notice] = 'Something went wrong!'
      redirect_to books_path
    end
  end

  def return
    @find_movement = @book.movements.where(taker_name: params[:taker_name]).last
    @movement = @find_movement.update(movement_params)
    if true
      flash[:notice] = 'Thanks for returning the book!'
      redirect_to book_path(@book)
    else
      flash[:notice] = 'Something went wrong!'
      redirect_to books_path
    end
  end

  private

  def movement_params
    params.permit(:taker_name, :taken_at, :returned_at, :book_id)
  end

  def set_book
    @book = Book.find(params[:book_id])
  end

  def default_values
    self.taker_name ||= "Vasya"
    self.taken_at   ||= Time.now
  end
end