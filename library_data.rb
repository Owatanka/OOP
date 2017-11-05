authors = [
    Author.new('Oles Honchar','about Honchar'),
    Author.new('Lesya Ukrainka','about Ukrainka'),
    Author.new('Gregory Skovoroda','about Skovoroda'),
    Author.new('Taras Schevchenko','about Schevchenko')
]

books = [
    Book.new('Собор', authors[0]),
    Book.new('За миг счастья', authors[0]),
    Book.new('Contra spev spero!', authors[1]),
    Book.new('На крыльях песен', authors[1]),
    Book.new('Боярыня', authors[1]),
    Book.new('Fables and Aphorisms', authors[2]),
    Book.new('Povna akademichna zbirka tvoriv', authors[2]),
    Book.new('Сочинения в двух томах', authors[2]),
    Book.new('Kobzar', authors[3]),
    Book.new('Gamaliya', authors[3]),
]

readers = [
    Reader.new('Aleks Tkach', 'alekstk@gmail.com'),
    Reader.new('Vera Zubrova', 'vera1@gmail.com'),
    Reader.new('Max T-rex', 'max@2921@gmail.com'),
]

orders = [
    Order.new(books[0],readers[2]),
    Order.new(books[1],readers[1]),
    Order.new(books[2],readers[0]),
    Order.new(books[2],readers[1]),
    Order.new(books[2],readers[2]),
    Order.new(books[4],readers[1]),
    Order.new(books[4],readers[2]),
    Order.new(books[5],readers[1]),
    Order.new(books[5],readers[2]),
    Order.new(books[5],readers[0]),
    Order.new(books[6],readers[1]),
    Order.new(books[6],readers[2]),
    Order.new(books[7],readers[2]),
    Order.new(books[0],readers[1]),
    
]


library = Library.new

books.each { |book| library.add_book(book)}
authors.each { |a| library.add_author(a)}
orders.each { |o| library.add_order(o)}
readers.each { |r| library.add_reader(r)}

#puts library

library.save
