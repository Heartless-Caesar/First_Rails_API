# frozen_string_literal: true

class Api::V1::BooksController < ApplicationController
  before_action :authorize
  before_action :set_book, only: %i[show update destroy]

  # GET /books
  def index
    @books = @user.books.all

    render json: @books
  end

  # GET /books/1
  def show
    render json: @book
  end

  # POST /books
  def create
    @book = Book.create(book_params.merge(user: @user))

    if @book.save
      render json: @book, status: :created
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /books/1
  def update
    current_book = Book.find_by(id: @book.id)
    if current_book.user_id == @user.id
      @book.update(book_params)
      render json: @book
    else
      render json: { msg: "This book wasn't created by the current user" }
    end
  end

  # DELETE /books/1
  def destroy
    @book.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_book
    @book = Book.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def book_params
    params.require(:book).permit(:title, :author)
  end
end
