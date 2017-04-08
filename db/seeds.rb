# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Booking.destroy_all
Book.destroy_all
User.destroy_all

user1 = User.create!(first_name: 'Harvey', last_name: 'Specter', email: 'james@gmail.com', photo: "http://res.cloudinary.com/dx9hracbg/image/upload/v1491674983/harvey_zxkcr0.png")
user2 = User.create!(first_name: 'Walter', last_name: 'White', email: 'walter@gmail.com', photo: "http://res.cloudinary.com/dx9hracbg/image/upload/v1491674836/walter_ngkehd.png")
user3 = User.create!(first_name: 'John', last_name: 'Snow', email: 'john@gmail.com', photo: "http://res.cloudinary.com/dx9hracbg/image/upload/v1491674231/john_a4q6ue.png")


book1 = Book.create!(title: 'The Lost Symbol' , author: 'D. Brown', summary: 'Set within the hidden chambers, tunnels, and temples of Washington, D.C., The Lost Symbol accelerates through a startling landscape toward an unthinkable finale', status: 'borrowed')
book2 = Book.create!(title: 'The Fellowship of the Ring', author: 'J. R. R. Tolkien', summary: 'The Fellowship of the Ring is the first of three volumes of the epic novel The Lord of the Rings')
book3 = Book.create!(title: 'Game of Thrones', author: 'George R.R. Martin', summary: 'A Game of Thrones is the first novel in A Song of Ice and Fire')
book4 = Book.create!(title: 'A Girl on the Train', author: 'P. Hawkins', summary: 'Rachel Watson is a 32-year-old alcoholic reeling from the dissolution of her marriage to Tom, who left her for another woman, Anna Watson', status: 'borrowed')


booking1 = Booking.create!(user: User.first, book: Book.first)
booking2 = Booking.create!(user: User.first, book: Book.last)
