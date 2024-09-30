class Book {
  String _title;
  String _author;
  int _year;

  Book(this._title, this._author, this._year);

  // Getters
  String get title => _title;
  String get author => _author;
  int get year => _year;

  // Setters
  set title(String newTitle) => _title = newTitle;
  set author(String newAuthor) => _author = newAuthor;
  set year(int newYear) => _year = newYear;

  @override
  String toString() {
    return 'Title: $_title, Author: $_author, Year: $_year';
  }
}

class Library {
  List<Book> _books = [];

  // Getter for books
  List<Book> get books => _books;

  void addBook(Book book) {
    _books.add(book);
    print('Book added: ${book.title}');
  }

  void removeBook(Book book) {
    if (_books.contains(book)) {
      _books.remove(book);
      print('Book removed: ${book.title}');
    } else {
      print('Book not found: ${book.title}');
    }
  }

  void displayBooks() {
    if (_books.isEmpty) {
      print('No books in the library.');
    } else {
      print('Library contains:');
      for (var book in _books) {
        print(book);
      }
    }
  }
}
