import '../../domain/repositories/book_repository.dart';
import '../datasources/local/local_data_source.dart';
import '../models/book_model.dart';

/// Concrete repository implementation for Books using [ILocalDataSource].
class BookRepositoryImpl implements IBookRepository {
  const BookRepositoryImpl(this._localDataSource);

  final ILocalDataSource _localDataSource;

  @override
  Future<List<BookModel>> getBooks({int limit = 50, int offset = 0, String? categoryId}) {
    return _localDataSource.getBooks(limit: limit, offset: offset, categoryId: categoryId);
  }

  @override
  Future<BookModel?> getBookById(String id) {
    return _localDataSource.getBookById(id);
  }

  @override
  Future<BookModel?> getBookByCid(String cid) {
    return _localDataSource.getBookByCid(cid);
  }

  @override
  Future<void> saveBook(BookModel book) {
    return _localDataSource.saveBook(book);
  }

  @override
  Future<void> saveBooksBatch(List<BookModel> books) {
    return _localDataSource.saveBooksBatch(books);
  }

  @override
  Future<void> deleteBook(String id) {
    return _localDataSource.softDeleteBook(id);
  }

  @override
  Stream<List<BookModel>> watchBooks({String? categoryId}) {
    return _localDataSource.watchBooks(categoryId: categoryId);
  }
}
