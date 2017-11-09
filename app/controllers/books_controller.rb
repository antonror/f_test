class BooksController < ApplicationController
  def index
    @books = %w[Book1, Book2, Book3]
  end
end