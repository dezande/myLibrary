class PagesController < ApplicationController
  def home
    @users = User.all
    @books = Book.all
  end
end
