class PagesController < ApplicationController
  def home
    # users
    @users = User.all
    @borrowers = count_borrowers

    # books
    @books = Book.all
    @available_books = (Book.all.select {|book| book.status == 'available'}).count
    @borrowed_books = @books.count - @available_books
  end

  def count_borrowers
    sum = 0
    User.all.each do |user|
      sum += 1 if user.bookings.present?
    end
  sum
  end
end
