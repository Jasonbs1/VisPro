import 'class.dart';  

void main() {
  var book1 = Book('buku1', 'C', 1949);
  var book2 = Book('buku2', 'B', 2001);
  var book3 = Book('buku3', 'A', 1993);

  var library = Library();

  library.addBook(book1);
  library.addBook(book2);
  library.addBook(book3);

  library.displayBooks();

  library.removeBook(book2);

  library.displayBooks();
}
