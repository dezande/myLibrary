class BookingsController < ApplicationController
  def new
    @booking = Booking.new

    # @users = []
    # User.all.each do |user|
    #   @users << [user.first_name]
    # end
    @users = User.all
    # @books = Book.all
    @books = Book.all.select {|book| book.status == 'available'}
  end

  def create
    @booking = Booking.new(bookings_params)
    if @booking.save
      redirect_to root_path
      @book= @booking.book
      @book.status = "borrowed"
      @book.save
    else
      render :new
    end
  end

  private

  def bookings_params
    params.require(:booking).permit(:user_id, :book_id)
  end
end
