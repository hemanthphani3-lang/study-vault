import '../../data/models/book_model.dart';

/// Domain contract for academic books and reference publication repository.
abstract interface class IBookRepository {
  Future<List<BookModel>> getBooks({int limit = 50, int offset = 0, String? categoryId});
  Future<BookModel?> getBookById(String id);
  Future<BookModel?> getBookByCid(String cid);
  Future<void> saveBook(BookModel book);
  Future<void> saveBooksBatch(List<BookModel> books);
  Future<void> deleteBook(String id);
  Stream<List<BookModel>> watchBooks({String? categoryId});
}
